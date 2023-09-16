$(function () {
    function display(bool) {
    if (bool) {
        $("body").show();
        $("#eclipse").show();
    } else {
        $("body").hide();
        $("#eclipse").hide();
    }
}

display(false)

window.addEventListener('message', function(event) {

        var item = event.data;

        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }

        eclipseCoords(event.data);
        eclipsenormalCoords(event.data);
        eclipsenvector3Coords(event.data);

    })
})

function eclipseClose(){
    $.post('http://coords/eclipsecloseButton');
}

function eclipseCopy(){
    const copyText = document.getElementById("eclipseCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function eclipsenormalCopy(){
    const copyText = document.getElementById("eclipsenormalCoords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function eclipsevector3Copy(){
    const copyText = document.getElementById("eclipsevector3Coords").textContent;
    const textArea = document.createElement('textarea');
    textArea.textContent = copyText;
    document.body.append(textArea);
    textArea.select();
    document.execCommand("copy");
}

function eclipseCoords(data) {

	if (data.type === 'eclipse') {
        eclipsecoordsStart(data);
    }

}

function eclipsenormalCoords(data) {

	if (data.type === 'normal') {
        eclipsecoordsnormalStart(data);
    }

}

function eclipsenvector3Coords(data) {

	if (data.type === 'vector3') {
        eclipsecoordsvector3Start(data);
    }

}

function eclipsecoordsStart(data){
    document.querySelector("#eclipseCoords").textContent = data.text;
}

function eclipsecoordsnormalStart(data){
    document.querySelector("#eclipsenormalCoords").textContent = data.text;
}

function eclipsecoordsvector3Start(data){
    document.querySelector("#eclipsevector3Coords").textContent = data.text;
}