function escapeHtml(unsafe) {
    return unsafe
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }
    display(false)
    window.addEventListener('message', (event) => {
        var item = event.data;
        if (item.type === "ui") {
            if (item.enable === true) {
                display(true)
				$.post("http://vorp_inventory/NUIFocusOff", JSON.stringify({}));
				isOpen = false;
                document.body.style.display = event.data.enable ? "block" : "none";
                var str = new String("")
                for (i in item.data) {
                    str = str + `<li>${escapeHtml(item.data[i])}</li>`

                }
                document.getElementById("notes").innerHTML = str
            } else {
                display(false)
                document.body.style.display = event.data.enable ? "none" : "block";
            }
        }

    });
    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('http://lto_notepad/exit', JSON.stringify({}));
        }
    };
    $("#submit").click(function () {
        let input = $("#form").val()
        if (input.length >= 2048) {
            $.post('http://lto_notepad/error', JSON.stringify({
                error: "Too many characters!",
            }));
            return;
        } else if (!input) {
            $.post('http://lto_notepad/exit', JSON.stringify({}));
            return
        }
        $.post('http://lto_notepad/save', JSON.stringify({
            main: input,
        }));
        return;
    });
    $("#clear").click(function () {
        $.post('http://lto_notepad/clear', JSON.stringify({}));
    })
});