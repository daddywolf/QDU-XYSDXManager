function newOrder() {
    var iWidth = 420;
    var iHeight = 500;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('neworder.jsp', 'newwindow', "AlwaysRaised=yes,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}


function ShowCalc() {
    var iWidth = 310;
    var iHeight = 410;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('../calc.html', 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}