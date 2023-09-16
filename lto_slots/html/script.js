// You can add or remove lines here
// each line represents the sequence of coordinates that form a line,
// coordinates starting at 0 and ending at 1
var lines = [
  [[0,0], [1,0], [2,0], [3,0], [4,0]],
  [[0,1], [1,1], [2,1], [3,1], [4,1]],
  [[0,2], [1,2], [2,2], [3,2], [4,2]],

  [[0,0], [1,1], [2,2], [3,1], [4,0]],
  [[0,2], [1,1], [2,0], [3,1], [4,2]]
];

// You can change the win multiplies here
// the first 0 doesn't matter but dont touch it
// each line represents the sequence of multiplications depending on how many of the same time are caught in a row in a row
// For example: The line (Joker) if you catch 3 in a row the multiply will be x2, if you catch 4 then it will be x3, if you catch 5 then it will be x4.
var winTable = [
  [0],
  [1,1,4,5,7], // Fer/Horseshoe
  [1,1,2,3,4], // Pick/Spade
  [1,1,3,4,5], // Treph/Cross
  [1,1,3,4,5], // Carrer/Square
  [1,1,3,4,6], // Coeur/Heart
  [1,1,2,3,4], // Joker
  [1,1,5,7,10] // #7
];


/// From here on out, be careful what you change, do it at your own risk
const SLOTS_PER_REEL = 12;
const REEL_RADIUS = 209;

var fructe = ["", "Cirese", "Prune", "Lamai", "Portocale", "Struguri", "Pepene", "Septar"];

var audios = [];
var audioIds = [
  "apasaButonul"
];

var coins = 0;
var bet = 5;

var backCoins = coins * 2;
var backBet = bet * 2;

var rolling = 0;

function playAudio(audioName) {
  if($('#sounds').is(':checked')) {
    for(var i = 0; i < audioIds.length; i++) {
      if(audioIds[i] == audioName) {
        audios[i].play();
      }
    }
  }
}

function insertCoin(amount) {
  coins += amount;
  backCoins = coins * 2;
  $('#ownedCoins').empty().append(coins);
}

function setBet(amount) {
  if(amount > 0) {
    if(amount > coins) {
      amount = 5;
    }
    bet = amount;
    backBet = bet * 2;
    $('#ownedBet').empty().append(bet);

  }
}

var tbl1 = [], tbl2 = [], tbl3 = [], tbl4 = [], tbl5 = [];
var crd1 = [], crd2 = [], crd3 = [], crd4 = [], crd5 = [];

function createSlots(ring, id) {
	var slotAngle = 360 / SLOTS_PER_REEL;
	var seed = getSeed();

	for (var i = 0; i < SLOTS_PER_REEL; i ++) {
		var slot = document.createElement('div');
		var transform = 'rotateX(' + (slotAngle * i) + 'deg) translateZ(' + REEL_RADIUS + 'px)';
		slot.style.transform = transform;

    var imgID = (seed + i)%7 + 1;
    seed = getSeed();
    if (imgID == 7) {
      imgID = (seed + i)%7 + 1;
    }

    slot.className = 'slot' + ' fruit' + imgID;
    slot.id = id + 'id' + i;
		var content = $(slot).empty().append('<p>' + createImage(imgID) + '</p>');

		ring.append(slot);
	}
}

function createImage(id) {
  return '<img src="img/item' + id + '.png" style="border-radius: 20px;" width=100 height=100>';
}

function getSeed() {
	return Math.floor(Math.random()*(SLOTS_PER_REEL));
}

function setWinner(cls, level) {
  if(level >= 1) {
    var cl = (level == 1) ? 'winner1' : 'winner2';
    $(cls).addClass(cl);
  }
}

function reverseStr(str) {
  return str.split("").reverse().join("");
}

var canDouble = 0;
var colorHistory = [-1];
var dubleDate = 0;

function endWithWin(x, sound) {
  $('#win').empty().append(x);
  $('.win').show();
  $('.dblOrNothing').show();

  $('.betUp').empty().append("RED");
  $('.AllIn').empty().append("BLACK");
  $('.go').empty().append("COLLECT");

  canDouble = x;

  if(sound == 1) { // WinAtDouble
    
    dubleDate++;
    if(dubleDate >= 4) {
      pressROLL();
    }
  }
}

function looseDouble() {
  canDouble = 0;
  dubleDate = 0;
  $('.win').hide();
  $('.dblOrNothing').hide();

  $('.betUp').empty().append("+BET");
  $('.AllIn').empty().append("ALL IN");
  $('.go').empty().append("SPIN");
}

function voteColor(x, color) {
  var rcolor = Math.floor(Math.random()*(2));
  colorHistory[colorHistory.length] = rcolor;

  var pls = 1;
  for(var cont = colorHistory.length; cont >= colorHistory.length-8; cont--) {
    var imgColor = "none";
    if(colorHistory[cont] == 1) { imgColor = 'black'; }
    if(colorHistory[cont] == 0) { imgColor = 'red'; }
    $('#h' + pls).empty();
    if(imgColor !== "none") {
      $('#h' + pls).append("<img src='img/" + imgColor + ".png' width=30px height=30px/>");
      pls++;
    }
  }

  if(rcolor == color) {
    endWithWin(x*2, 1);
  } else {
    looseDouble();
  }
}

function spin(timer) {var winnings = 0, backWinnings = 0;

	for(var i = 1; i < 6; i ++) {
    var z = 2;
		var oldSeed = -1;

		var oldClass = $('#ring'+i).attr('class');
		if(oldClass.length > 4) {
			oldSeed = parseInt(oldClass.slice(10));
		}
		var seed = getSeed();
		while(oldSeed == seed) {
			seed = getSeed();
		}

    var pSeed = seed
    for(var j = 1; j <= 5; j++) {
      pSeed += 1;
      if(pSeed == 12) {
        pSeed = 0;
      }
      if(j>=3) {
        var msg = $('#' + i + 'id' + pSeed).attr('class');
        switch(i) {
          case 1:
            tbl1[z] = reverseStr(msg)[0];
            crd1[z] = '#' + i + 'id' + pSeed
            break;
          case 2:
            tbl2[z] = reverseStr(msg)[0];
            crd2[z] = '#' + i + 'id' + pSeed
            break;
          case 3:
            tbl3[z] = reverseStr(msg)[0];
            crd3[z] = '#' + i + 'id' + pSeed
            break;
          case 4:
            tbl4[z] = reverseStr(msg)[0];
            crd4[z] = '#' + i + 'id' + pSeed
            break;
          case 5:
            tbl5[z] = reverseStr(msg)[0];
            crd5[z] = '#' + i + 'id' + pSeed
            break;
        }
        z -= 1;
      }
    }

		$('#ring'+i)
			.css('animation','back-spin 1s, spin-' + seed + ' ' + (timer + i*0.5) + 's')
			.attr('class','ring spin-' + seed);
	}
  var table = [tbl1,tbl2,tbl3,tbl4,tbl5];
  var cords = [crd1,crd2,crd3,crd4,crd5];

  for(var k in lines) {
    var wins = 0, last = table[lines[k][0][0]][lines[k][0][1]], lvl = 0, lasx;

    for(var x = 1 in lines[k]) {

      if(last == table[lines[k][x][0]][lines[k][x][1]]) {
        wins++;

          last = table[lines[k][x][0]][lines[k][x][1]];

      }
      else break;
    }

    switch (wins) {
      case 2:
        if(last == 1) {
          lvl = 1;

        }
        break;
      case 3:
        lvl = 1;

        break;
      case 4:
        lvl = 2;

        break;
      case 5:
        lvl = 2;

        break;
      default: 0;
    }
    if(lvl > 0) {
      winnings = winnings + bet * winTable[table[lines[k][wins-1][0]][lines[k][wins-1][1]]][wins-1];
      setTimeout(endWithWin, 4400, winnings, 0);
    }

    for(var p = wins - 1; p >= 0; p--) {
      setTimeout(setWinner, 3200 + 0.4 * p * 1000 + 0.3 * k * 1000, cords[lines[k][p][0]][lines[k][p][1]], lvl);
    }
  }
  setTimeout(function(){ rolling = 0; }, 4500);
}

function pressROLL() {
  if(rolling == 0) {
    if(canDouble == 0) {
      if(backCoins / 2 !== coins) {
        coins = backCoins / 2;
      }
      if(backBet / 2 !== bet) {
        bet = backBet / 2;
      }

      playAudio("apasaButonul");
      $('.slot').removeClass('winner1 winner2');
      if(coins >= bet && coins !== 0) {
        insertCoin(-bet);

        rolling = 1;
        var timer = 2;
        spin(timer);
      } else if(bet != coins && bet != 50) {
        setBet(coins);
      }
    } else {
      setTimeout(insertCoin, 200, canDouble);

      looseDouble();
    }
  }
}

function pressBLACK() {
  if(canDouble == 0) {
    setBet(coins);
  } else {
    voteColor(canDouble, 0);
  }
}

function pressRED() {
  if(canDouble == 0) {
    setBet(bet + 5);
  } else {
    voteColor(canDouble, 0);
  }
}

var allFile;

function resetRings() {
  var rng1 = $("#ring1"),
      rng2 = $("#ring2"),
      rng3 = $("#ring3"),
      rng4 = $("#ring4"),
      rng5 = $("#ring5");

  rng1.empty()
    .removeClass()
    .addClass("ring")
    .removeAttr('id')
    .attr('id', 'ring1');

  rng2.empty()
    .removeClass()
    .addClass("ring")
    .removeAttr('id')
    .attr('id', 'ring2');

  rng3.empty()
    .removeClass()
    .addClass("ring")
    .removeAttr('id')
    .attr('id', 'ring3');

  rng4.empty()
    .removeClass()
    .addClass("ring")
    .removeAttr('id')
    .attr('id', 'ring4');

  rng5.empty()
    .removeClass()
    .addClass("ring")
    .removeAttr('id')
    .attr('id', 'ring5');

  createSlots($('#ring1'), 1);
  createSlots($('#ring2'), 2);
  createSlots($('#ring3'), 3);
  createSlots($('#ring4'), 4);
  createSlots($('#ring5'), 5);
}

function togglePacanele(start, banuti) {
  if(start == true) {
    allFile.css("display", "block");

    coins = 0;
    insertCoin(banuti);

    resetRings();

    rolling = 1;
    setTimeout(function(){ rolling = 0; }, 4000);
  } else {
    allFile.css("display", "none");
    $.post("http://lto_slots/exitWith", JSON.stringify({
      coinAmount: backCoins / 2
    }));
    insertCoin(-coins); // Scoate toti banii din aparat
  }
}

window.addEventListener('message', function(event) {
  if(event.data.showPacanele == "open") {
    var introdusi = event.data.coinAmount;
    togglePacanele(true, introdusi);
  }
});

$(document).ready(function() {
	allFile = $("#stage");
  allFile.css("display", "none");
  createSlots($('#ring1'), 1);
 	createSlots($('#ring2'), 2);
 	createSlots($('#ring3'), 3);
 	createSlots($('#ring4'), 4);
 	createSlots($('#ring5'), 5);
  for(var i = 0; i < audioIds.length; i++) {
    audios[i] = document.createElement('audio');
    audios[i].setAttribute('src', 'audio/' + audioIds[i] + '.wav');
    audios[i].volume = 0.4;
    if(audioIds[i] == "seInvarte") {
      audios[i].volume = 0.07;
    }
  }

  $('.win').hide();
  $('.dblOrNothing').hide();

  $('#ownedCoins').empty().append(coins);
  $('#ownedBet').empty().append(bet);

  $('body').keyup(function(e){
    $(':focus').blur();
    switch (e.keyCode) {
      case 32: pressROLL(); // space
        break;
      case 13: pressROLL(); // enter
        break;
      case 37: pressRED(); // left-arrow
        break;
      case 38: setBet(bet + 5); // creste BET
        break;
      case 40: setBet(bet - 5); // scade BET
        break;
      case 27: togglePacanele(false, 0); // ESC
        break;
      case 80: togglePacanele(false, 0); // P - Pause Menu
        break;
    }
  });

  $('.betUp').on('click', function(){ // RED
    pressRED();
  })

  $('.AllIn').on('click', function(){ // BLACK
    pressBLACK();
  })

 	$('.go').on('click',function(){ // COLLECT
    pressROLL();
 	})
});

