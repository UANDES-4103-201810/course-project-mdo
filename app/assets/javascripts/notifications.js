function sendNotice(message) {
    let notice_div = document.getElementById("ajax_notice");
    notice_div.innerHTML = message;
    notice_div.removeAttribute("hidden");
    setTimeout(function () {
        notice_div.hidden = true;
    }, 3000);
}