/**
 * Created by daddywolf on 16/3/6.
 */
/**
 * 显示计算器
 * @constructor
 */
function ShowCalc() {
    var iWidth = 310;
    var iHeight = 410;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('calc.html', 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * 显示学校电话
 * @constructor
 */
function ShowPhone() {
    var iWidth = 420;
    var iHeight = 500;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('admin-phone.jsp', 'newwindow', "AlwaysRaised=yes,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * 添加QQ好友
 * @constructor
 */
function QQfriend(QQnumber) {
    var iWidth = 1000;
    var iHeight = 400;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('http://wpa.qq.com/msgrd?v=3&uin=' + QQnumber + '&site=qq&menu=yes', 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * 显示对本班报道情况计数
 * @constructor
 */
function ShowCount() {
    var iWidth = 350;
    var iHeight = 360;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('admin-count.jsp', 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}
/**
 * 报到弹框
 * @param stuID
 * @param username
 * @param idcard
 */
function checkin(stuID, username) {
    var r = confirm("学号:" + stuID + "\n姓名:" + username + "\n这位同学已报到吗?");
    if (r == true) {
        CheckinWindow(stuID, username);
    }
    else {
        window.close()
    }
}

/**
 * 报到窗口
 * @param stuID
 * @param username
 * @param idcard
 * @constructor
 */
function CheckinWindow(stuID, username) {
    var iWidth = 500;
    var iHeight = 450;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('admin-checkin.jsp?stuID=' + stuID + '&username=' + username, 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * 报到窗口
 * @param stuID
 * @param username
 * @param idcard
 * @constructor
 */
function reCheckinWindow(stuID, username) {
    var iWidth = 500;
    var iHeight = 450;
    var iTop = (window.screen.height - iHeight) / 2;
    var iLeft = (window.screen.width - iWidth) / 2;
    window.open('admin-recheckin.jsp?stuID=' + stuID + '&username=' + username, 'newwindow', "AlwaysRaised=yes,Scrollbars=no,Toolbar=no,Location=no,Direction=no,Resizeable=no,Width=" + iWidth + " ,Height=" + iHeight + ",top=" + iTop + ",left=" + iLeft);
}

/**
 * AJAX获取XMLHttpRequest方法
 * @returns {*}
 */
function createXMLHttpRequest() {
    try {
        return new XMLHttpRequest();//大多数浏览器
    } catch (e) {
        try {
            return new ActiveXObject("Msxml2.XMLHTTP");//IE6.0
        } catch (e) {
            try {
                return new ActiveXObject("Microsoft.XMLHTTP");//IE5.5及更早版本
            } catch (e) {
                alert("哥们儿，您用的是什么浏览器啊？");
                throw e;
            }
        }
    }
}
