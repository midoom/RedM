var data
var book = document.getElementsByClassName("flipbook")[0]
var frontimage = document.getElementById("frontimage")
var midimage = document.getElementById("midimage")
var backimage = document.getElementById("backimage")
var inited = false
var editable = false
var currentEditingPageIndex
var _editor
var settings
var onClose
var bookIsOpen = false

document.getElementById("closesettingsbutton").onclick = function() {
    SetClass("w_settings","off")
}

function StartBook(args) {
    if( args == null ) { return false }
    if( args.data == null ) {return false}
    d = args.data
    edit = !!args.edit
    onClose = args.onClose

    SetClass("w_book","off",false)
    SetClass("w_content","off",false)

    if( !inited ) {
        inited = true
        $('.flipbook').turn({
            width:922*1.5,
            height:600*1.5,
            elevation: 50,
            gradients: true,
            autoCenter: true
        });
    }

    editable = edit
    data = d
    frontimage.value = data.frontImage || ""; frontimage.onchange = function() { data.frontImage = frontimage.value }
    midimage.value = data.midImage || ""; midimage.onchange = function() { data.midimage = midimage.value }
    backimage.value = data.backImage || ""; backimage.onchange = function() { data.backimage = backimage.value }

    if( data == null || data == "" || data.pages == null || data.pages.length == 0 ) {
        $(".flipbook").turn("addPage", CreatePageElement(editable))
        $(".flipbook").turn("addPage", CreatePageElement(editable))
        $(".flipbook").turn("addPage", CreatePageElement(editable))
    } else {
        BuildPages()
        $(".flipbook").turn("page",1);
    }
    $(".flipbook").bind("turned", function(event, page, view) {
        document.getElementsByClassName("w_flip")[0].classList.toggle("off",true)
    });
}

function StopBook() {
    SetClass("w_book","off",true)
    SetClass("w_content","off",true)
}

function BuildPages() {
    var pageCount = $(".flipbook").turn("pages")
    for( var i = pageCount; i > 0; i--) {
        if($(".flipbook").turn("hasPage",i) == false ) { continue}
        $(".flipbook").turn("removePage", i);
    }
    for( var i = 0; i < data.pages.length; i++ ) {
        $(".flipbook").turn("addPage", CreatePageElement(editable,data.pages[i]))
    }
}

function CreatePageElement(editable,data) {
    var element = document.createElement("div")
    element.classList.add("w_bookpage")
    element.id = "bookpage" + ($(".flipbook").turn("pages")+1)
    if( data != null && data.background != null ) {
        element.style.backgroundImage = "url('"+data.background+"')"
    }
    if( data != null && data.backgroundColor != null ) {
        element.style.backgroundColor = data.backgroundColor
    }
    if( data != null && data.color != null ) {
        element.style.color = data.color
    }
    var cont = document.createElement("div")
    cont.id = "pagecontent" + ($(".flipbook").turn("pages")+1)
    cont.classList.add("w_pagecontent")
    cont.setAttribute("pageIndex",$(".flipbook").turn("pages")+1)
    cont.innerHTML = data.content || ""
    element.appendChild(cont)
    return element
}

function SetClass(className,otherClassName,enable) {
    if(document.getElementsByClassName(className).length == 1 ) {
        document.getElementsByClassName(className)[0].classList.toggle(otherClassName,enable)} 
		else 
		{document.getElementById(className).classList.toggle(otherClassName,enable)}
}

function index(page) {
    $(".flipbook").turn("page",page);
}

window.addEventListener('message', function(event) {

    if (event.data.type == "OpenBookGui") {
        if (event.data.value == true) {
			$.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
			isOpen = false;
            var url = new URL(window.location.href);
            StartBook({data:{pages:[
            {   /* 1 cover */
                content:"",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881487266650914886/First-Top-Page.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 2 index */
                content:"<div class=\"ProductPurchaseButtons__buttons__14Q7z\"><h2 class=\"index_header\">Table of Contents</h2><div class=\"ProductPurchaseButtons__button__index__news\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(4)\" type=\"button\"><span class=\"Button__text__index\">Lastest News</span></button></div>        <div class=\"ProductPurchaseButtons__button__index__stores\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(6)\" type=\"button\"><span class=\"Button__text__index\">Stores</span></button></div>     <div class=\"ProductPurchaseButtons__button__index__crimes\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(8)\" type=\"button\"><span class=\"Button__text__index\">Crimes</span></button></div>     <div class=\"ProductPurchaseButtons__button__index__business\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(10)\" type=\"button\"><span class=\"Button__text__index\">Business</span></button></div>     <div class=\"ProductPurchaseButtons__button__index__comic\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(14)\" type=\"button\"><span class=\"Button__text__index\">Comic</span></button></div>   <div class=\"ProductPurchaseButtons__button__index__misc\" tabindex=\"0\">         <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"index(12)\" type=\"button\"><span class=\"Button__text__index\">Miscellaneous</span></button></div><div class=\"ProductPurchaseButtons__button__index__close\" tabindex=\"0\"> <button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"index\" onclick=\"Post('http://trp_newspaper/close')\" type=\"button\"> <span class=\"Button__text__index\">Close</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881464182023790592/left-page.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 3 ad */
                content:"",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881497415079825458/pub.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 4 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881724932948631592/page1.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 5 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:'https://cdn.discordapp.com/attachments/737489445019975763/881741741546405918/page2.png',
                backgroundColor:"fff",
                color:"",
            },
            {   /* 6 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",                            
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881756640485986314/page3.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 7 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",                            
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881778511734509618/page4.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 8 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",                            
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881793514587967539/page5.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 9 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",                            
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881788150052175882/page6.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 10 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881806715576786964/page7.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 11 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881806742994968576/page8.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 12 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881841030087970906/page9.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 13 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881836867534880778/page10.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 14 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881864250568638504/page11.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 15 */
                content:"<div class=\"ProductPurchaseButtons__button__back\" tabindex=\"0\"><button class=\"Button__btn__1bc-t Button__black__h0BRc\" data-ui-name=\"back\" onclick=\"index(2)\"type=\"button\"><span class=\"Button__text__2C2ug\" id=\"back\">Back to index</span></button></div></div>",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881868434617536542/page12.png",
                backgroundColor:"#fff",
                color:"white",
            },
            {   /* 16 back-side*/
                content:"",
                background:"https://cdn.discordapp.com/attachments/737489445019975763/881871060507713586/page13.png",
                backgroundColor:"#fff",
                color:"white",
            },
        ],
    },
    edit: (url.searchParams.get("edit") != null),
	})
            bookIsOpen = true
        } else if (event.data.value === false) {
            if (bookIsOpen) {
                StopBook()
            }
        }
    }
})

$(document).keydown(function(e){
    var previous = 37, next = 39, close = 27, close2 = 8;
    switch (e.keyCode) {
        case previous:
        $('.flipbook').turn('previous');
        break;
        case next:
        $('.flipbook').turn('next');            
        break;
        
        case close:
        Post('http://trp_newspaper/close')
        break;

        case close2:
        Post('http://trp_newspaper/close')
        break;
    }
});

function Buy(weapon,isammo) {
    var d = {}
    d.weapon = weapon;
    if (isammo == null) {
        d.isammo = 0
    } else {
        d.isammo = isammo;
    }
    Post('http://trp_newspaper/purchaseweapon',d)
}

Post = function(url,data) {
    var d = (data ? data : {});
    $.post(url,JSON.stringify(d));
};