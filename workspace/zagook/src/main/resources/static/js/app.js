var stompClient = null;

function setConnected(connected) {
    $("#connect_btn").prop("disabled", connected);
    $("#disconnect_btn").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#msg").html("");
}

function connect() {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/public', function (message) {
            showMessage("▶ " + message.body); // 서버에 메시지 전달 후 리턴받는 메시지
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
    let message = $("#msg").val()
    showMessage("문의 사항: " + message);

    stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); // 서버에 보낼 메시지
}

function showMessage(message) {
    $("#communicate").append("<tr><td>" + message + "</td></tr>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect_btn" ).click(function() { connect(); });
    $( "#disconnect_btn" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendMessage(); });
});

