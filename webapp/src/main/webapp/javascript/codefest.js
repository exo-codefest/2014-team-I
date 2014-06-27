(function($) {

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
alert ("tst");
    ev.dataTransfer.setData("Text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("Text");
    ev.target.appendChild(document.getElementById(data));
}

})($);
