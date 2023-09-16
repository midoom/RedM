let type;
let value;
let test
let mail
let ad 
let sendto
let msgbody
let viewedmsg
let viewedmsgid
let mailingadress
let change = false
let changered = false
let changeadressbook = false
let deletedmsg = false
let viewedid = []
let deletedid = []


function viewmsg(text) { 
    viewedmsg = text
    $('#list2').html('');
    $("#container-inbox").hide(); 
    $("#container-landing").hide(); 
    $("#container-viewedmsg").show(); 
    for (const [ind, tab] of Object.entries(mail)) {
        if (ind == text){
            viewedmsgid = tab.id
            $('#list2').append(
               /*  "<li id =`typeformating`><h3'>Date:</h3>&nbsp<h3'>"+tab.date+"</h3></li>", */
                "<li><h3'>Heure:</h3>&nbsp<h3'>"+tab.time+"</h3></li>",
                "<li><h3'>Expediteur:</h3>&nbsp<h3'>"+tab.sender+"</h3></li>",
                "<li><h3'>Lettre:</h3>&nbsp<h3'>"+tab.msgs+"</h3></li>",
            ); 
            if (tab.unred == 1) {
                tab.unred = 0
                viewedid.push(tab.id)
                change = true
                changered = true
            } 
            
        }
        
    } 
}

function convertDate(d) {
    let p = d.split("/");
    return +(p[2]+p[1]+p[0]);
}
function convertTime(d) {
    let p = d.split(":");
    return +(p[1]+p[0]);
}
function sortTable(table) {
    table.sort(function (y, x) { return convertTime(x.time) - convertTime(y.time); });
    table.sort(function (y, x) { return convertDate(x.date) - convertDate(y.date); });
}

function loadlist() { 
    $('.grid-container').html('') // This would clean up all the elements in the list id 
    $('#dropbtn').html('')
    $('#dropbtn2').html('')
    sortTable(mail)
    for (const [ind, tab] of Object.entries(mail)) {
        $('.grid-container').append(
            `<button
            id = "viewmsgbutton"
            onclick='viewmsg(${ind})'
            <div>
            <li>
            Sender: ${tab.sender}
            </li>
            <li>
            Time: ${tab.time}
            </li>
            </div>
            </button>`
        );
    } 
    let select = $('#dropbtn')
    let select2 = $('#dropbtn2')
    let options = ad

    let i;
    for (i = 0; i < options.length; i++) {
        let opt = options[i];
        let el = document.createElement("option");
        el.textContent = opt.name;
        el.value = opt.inbox;
        el.id = "dropdown";
        select.append(el);
        select2.append(el);
    }
}
function loadadressbook() { 
    $('#dropbtn').html('')
    let select = $('#dropbtn')
    let options = ad

    let i;
    for (i = 0; i < options.length; i++) {
        let opt = options[i];
        let el = document.createElement("option");
        el.textContent = opt.name;
        el.value = opt.inbox;
        el.id = "dropdown";
        select.append(el);
    }
}
function loadadressbook2() { 
    $('#dropbtn2').html('')
    let select = $('#dropbtn2')
    let options = ad

    let i;
    for (i = 0; i < options.length; i++) {
        let opt = options[i];
        let el = document.createElement("option");
        el.textContent = opt.name;
        el.value = opt.inbox;
        el.id = "dropdown";
        select.append(el);
    }
}

function loadnewmsgs() { 
    let createbutton = false
    let buttoninfo = 0
    let msg 
    let x;
    $('#list3').html('') // This would clean up all the elements in the list id 
    for (x = 0; x < mail.length; x++) {
        if (mail[x].unred == "1") {
            createbutton = true
            buttoninfo = buttoninfo+1
            msg = x
        } 
    } 
    if (createbutton) {
        $('#list3').append(
            `<button id="newmail"  onclick='viewmsg(${msg})' type="button">You Have ${buttoninfo} Unred Letters</button>`
        );
       
    }
    else if (!createbutton) {
        $('#list3').append(
            `<button id="newmail" type="button">No New Mail</button>`
        );
    }
   
    let select = $('#dropbtn')
    let options = ad

    let i;
    for (i = 0; i < options.length; i++) {
        let opt = options[i];
        let el = document.createElement("option");
        el.textContent = opt.name;
        el.value = opt.inbox;
        el.id = "dropdown";
        select.append(el);
    }
}



function showHide(){
    
}

function goback() { 
    $("#container-viewedmsg").hide(); 
    loadnewmsgs()
    loadlist()
    $("#container-inbox").show();   
}
function deletemsg() { 
  mail.splice(viewedmsg, 1);
  $("#container-viewedmsg").hide(); 
  loadnewmsgs()
  loadlist()
  $("#container-inbox").show(); 
  change = true
  deletedmsg = true
  deletedid.push(viewedmsgid)
}

$(document).ready(function(){
  
    $(".container").hide();
    $("#container-viewedmsg").hide();    
    $("#container-landing").hide();
    $("#container-sendmsg").hide();
    $("#container-adressbook").hide(); 
    $("#container-inbox").hide(); 

    window.addEventListener('message', function(event){
        let data = event.data;
        type=data.action;
        mail = data.mail;
        ad = data.ad
        mailingadress = data.mailingadress
        if (data.action == "show") {
            $("#container-viewedmsg").hide();    
            $("#container-sendmsg").hide();
            $("#container-adressbook").hide(); 
            $("#container-inbox").hide();
            loadnewmsgs()
            $('#landingtitle').html('')
            $('#landingtitle').append(
                `<h3 id = "landingtitle">Destinataire:${mailingadress}</h3> `
            );
            $(".container").fadeIn(1000);
            $("#container-landing").fadeIn(0);

        }

    });


});


$("#sendmsg2").click(function (event) {
    $("#container-landing").hide();
    loadlist()
    loadadressbook()
    $("#container-sendmsg").show(); 
 });

$("#checkmail").click(function (event) {
    $("#container-landing").hide();
    loadlist()
    $("#container-inbox").show(); 
 });

 $("#adressbook1").click(function (event) {
    $("#container-landing").hide();
    loadlist()
    loadadressbook2()
    $("#container-adressbook").show(); 
 });

 $("#deleteadress").click(function (event) {
    change = true
    changeadressbook = true
    let deletedvalue = $('#dropbtn2')[0].value
    console.log(deletedvalue)
    for (const [ind, tab] of Object.entries(ad)) {
        if (tab.inbox == deletedvalue) {
            console.log(ind)
            ad.splice(ind, 1);
        }
    }
    $("#container-adressbook").hide();
    loadnewmsgs()
    loadlist()
    loadadressbook()
    loadadressbook2()
    $("#container-landing").show(); 
 });

$("#submit3").click(function (event) {
    sendto = $('#dropbtn')[0].value
    console.log(sendto)
    msgbody = $('#box3')[0].value
    $(".container").hide();    
    $("#container-viewedmsg").hide();    
    $("#container-landing").hide();
    $("#container-inbox").hide(); 
    $("#container-clanrename").hide();
    $("#container-adressbook").hide();  
    $.post('http://syn_mail/send', JSON.stringify({ad:ad,sendto:sendto,msgbody:msgbody, change:change,changered:changered
    ,changeadressbook:changeadressbook,deletedmsg:deletedmsg,viewedid:viewedid,
    deletedid:deletedid}));
    viewedid = []
    deletedid = []
    sendto = null
    msgbody = null
    change = false
    changered = false
    changeadressbook = false
    deletedmsg = false
    mail = null

    
 });

 $("#submit2").click(function (event) {
    $("#container-inbox").hide(); 
    loadnewmsgs()
    $("#container-landing").show(); 
 });

 $("#submit5").click(function (event) {
    $("#container-adressbook").hide(); 
    loadnewmsgs()
    $("#container-landing").show(); 
 });

 $("#saveinfo").click(function (event) {
    let x = $('#name')[0].value
    let y = $('#adress')[0].value
    let z = {"name" : x, "inbox" : y }
    ad.push(z)
    change = true
    changeadressbook = true
    $("#container-adressbook").hide(); 
    loadnewmsgs()
    $("#container-landing").show(); 
 });

 $("#submit4").click(function (event) {
    $("#container-sendmsg").hide(); 
    loadnewmsgs()
    $("#container-landing").show(); 
 });

 $("#close").click(function (event) {
    $(".container").hide();    
    $("#container-viewedmsg").hide();    
    $("#container-landing").hide();
    $("#container-inbox").hide(); 
    $("#container-clanrename").hide();
    $("#container-adressbook").hide();  
    $.post('http://syn_mail/closeui', JSON.stringify({ad:ad, change:change,changered:changered
    ,changeadressbook:changeadressbook,deletedmsg:deletedmsg,viewedid:viewedid,
    deletedid:deletedid}));
    viewedid = []
    deletedid = []
    change = false
    changered = false
    changeadressbook = false
    deletedmsg = false
    mail = null
 });

