var elem = document.getElementById("myButton1");
var displayed = false
btn = document.createElement("img");
let resourceName;
let test 
let charidentifier
let id
let group
let showstuff = false
$(document).keydown(function(e){
	var close = 27, close2 = 8;
	switch (e.keyCode) {
		case close:
            btn.style.visibility = 'hidden';
            var button = document.getElementById("remove");
            button.style="display: none;";
			$.post('http://'+resourceName+'/exit')
           break;
        case close2:
            btn.style.visibility = 'hidden';
            var button = document.getElementById("remove");
            button.style="display: none;";
            if (showstuff) {
                showstuff = false
                $(".paper").hide(); 
                loadTableData(test)
            }
		break;

	}
});


$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    function display2(bool) {
        if (bool) {
            $("#container2").show();
        } else {
            $("#container2").hide();
        }
    }


    display(false)
    display2(false)


    window.addEventListener('message', function(event) {
        resourceName = event.data.resourceName;
        var item = event.data;
        charidentifier = item.charidentifier
        group = item.group
        if (item.type === "ui") {
            if (item.status == true) {
            } else {
                display(false)
            }
        }
        if (item.type === "poster_table") {
            if (item.status == true) {
                table_img = item.table_for_json
                test = table_img
                loadTableData(table_img)
                display(true)
                display2(true)
                $(".paper").hide(); 

            } else {
                display(false)
                display2(false)
                $(".paper").hide(); 

            }
        }

    })

    $("#close").click(function () {
        btn.style.visibility = 'hidden';
        $.post('http://'+resourceName+'/exit', JSON.stringify({}));
        return
    })

})

function send_values() {
    let x = document.getElementById("Title").value;
    let y = document.getElementById("Link").value;
    document.getElementById("Forma").reset();
    $.post('http://'+resourceName+'/send_to_poster', JSON.stringify({ Title: x, Link : y }));
}

function Remove(form_id) {
    var f = document.getElementById(form_id);
    f.parentNode.removeChild(f);
}
function Add(form_id) {
    var f = document.getElementById(form_id);
    f.parentNode.addChild(f);
}
function checkstring(string){
    var a = string;
    if (a.indexOf('http') > -1) {
      return true;
    } else {
      return false;
    }
}
function loadTableData(table_img){
    const tableBody = document.getElementById('tableData');
    let dataHtml = '';

    for(var i in table_img){
        // dataHtml += '<tr><td><center>'+table_img[i].title+'</center></br><img src="'+table_img[i].poster_link+'"width="200" height="200"></td></tr></br></br></br></br>'; 
        let checkimage = checkstring(table_img[i].poster_link)
        if (checkimage) {
            dataHtml += '<div class="box_'+i+'"><button type="button" onclick="open_image('+i+')" ><center>'+table_img[i].title+'</br><img src="'+table_img[i].poster_link+'"width="140" height="180"></button></center></div>'
        }else {
            dataHtml += '<div class="box_'+i+'"><button type="button" onclick="open_image2('+i+')" ><center>'+table_img[i].title+'</br>'+table_img[i].poster_link+'</button></center></div>'
        }
    }

    tableBody.innerHTML = dataHtml
}

function open_image(link) {
    btn.setAttribute("id", "container3");
    btn.style.visibility = 'visible';
    btn.style.backgroundImage = 'url()';
    btn.style.backgroundImage = 'url('+table_img[link].poster_link+')';
    btn.style.backgroundSize = "100% 100%";
    let char = table_img[link].charidentifier
    document.body.appendChild(btn);
    if (charidentifier == char || group) {
        id = table_img[link].id
        var button = document.getElementById("remove");
        button.style="display: show;";
    }
} 

function open_image2(link) {
    const tableBody = document.getElementById('tableData');
    let dataHtml = '';
    tableBody.innerHTML = dataHtml
    showstuff = true 
    $(".paper").show(); 
    let desc = table_img[link].poster_link
    let char = table_img[link].charidentifier
    var nam = document.getElementById("desc");
    nam.style="display: show;";
    nam.innerHTML = `${desc}`;
    if (charidentifier == char || group) {
        id = table_img[link].id
        var button = document.getElementById("remove");
        button.style="display: show;";
    }
} 
function send_values2() {
    btn.style.visibility = 'hidden';
    $.post('http://'+resourceName+'/removepin', JSON.stringify({id:id}));
}

