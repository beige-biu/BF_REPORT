<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrameWork.web._Default" %>


<html>
<head>
    <link rel="stylesheet" href="css/Site_Css.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="inc/FineMessBox/css/subModal.css" />
    <link rel="shortcut icon" href="images/Icon.ico" type="image/x-icon" />
    <script type="text/javascript" src="inc/FineMessBox/js/common.js"></script>
    <script type="text/javascript" src="inc/FineMessBox/js/subModal.js"></script>
    <title>
        <%=FrameName %></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style type="text/css">
        .navPoint
        {
            font-family: Webdings;
            font-size: 9pt;
            color: white;
            cursor: pointer;
        }
        p
        {
            font-size: 9pt;
        }
        
        .font_size
        {
            font-family: "Verdana" , "Arial" , "Helvetica" , "sans-serif";
            font-size: 12px;
            font-weight: normal;
            font-variant: normal;
            text-transform: none;
        }
    </style>
</head>
<body scroll="no" leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" onload="showTime()">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
        <tr>
            <td width="100%" height="30" colspan="3" style="border-bottom: 1px solid #000000">
                <table height="30" border="0" cellspacing="0" cellpadding="0" width="100%" class="font_size">
                    <tr>                        
                        <td width="20%" align="center" style="background-color:#9aadcd; font-size:14px">
                            欢迎你:<%=UserName %>
                        </td>
                        <td width="60%" align="center" style="background-color:#9aadcd; font-size: 18pt;">
                            <%--兴澄炼铁二级报表系统--%>
                        </td>                        
                        <td width="20%" align="right" style="background-color:#9aadcd">
                            <table style="background-color:#7898A8">
                                <tr>
                                    <td></td>
                                    <td style="cursor: pointer; font-size:14px; border-left: 1px solid #FFFFFF;" onclick="javascript:showPopWin('个人设定','UserSet.aspx?rand'+rand(100000000),260, 160, AlertMessageBox,true)">
                                        &nbsp;<img src="images/userset.gif" style="margin-bottom: -3px">&nbsp;个人设定
                                    </td>
                                    
                                    <td style="cursor: pointer; font-size:14px; border-left: 1px solid #FFFFFF;" onclick="javascript: window.top.location.href = 'LoginOut.aspx'">
                                        &nbsp;<img src="images/logout.gif" style="margin-bottom: -3px">&nbsp;退出系统
                                    </td>
                                    <td style="cursor:pointer;border-left:1px solid #FFFFFF;" >
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Visible="false">帮助手册</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>                        
                    </tr>
                </table>
            </td>
        </tr>
        <%
            MenuStyle = 0;
            switch (MenuStyle)
            {
                case 0:
        %>
        <tr>
            <td id="frmTitle" name="frmTitle" nowrap="nowrap" valign="middle" align="center"
                width="198" style="border-right: 1px solid #000000">
                <iframe name="BoardTitle" style="height: 100%; visibility: inherit; width: 198; z-index: 2"
                    scrolling="auto" frameborder="0" src="left.aspx"></iframe>
            </td>
            <td style="width: 10pt" bgcolor="#7898A8" width="10" title="关闭/打开左栏" class="navPoint">
                <table border="0" cellpadding="0" cellspacing="0" width="11" height="100%" align="right">
                    <tr>
                        <td valign="middle" align="right" class="middleCss">
                            <img border="0" src="images/Menu/close.gif" id="menuimg" alt="隐藏左栏" onmouseover="javascript: menuonmouseover();"
                                onmouseout="javascript: menuonmouseout();" onclick="javascript:switchSysBar()"
                                style="cursor: hand" width="11" height="76" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 100%">
                <iframe id="Iframe" name="mainFrame" style="height: 100%; visibility: inherit; width: 100%;
                    <%--z-index: 1" scrolling="auto" frameborder="0" src="Module/Report/1280BF/Main_Rep_0.aspx"></iframe>--%>
                    z-index: 1" scrolling="auto" frameborder="0" src="Module/Report/1500BF/Main_Rep_NEW.aspx"></iframe>
            </td>
        </tr>
        <%
            break;
        case 1:
            
        %>
        <tr>
            <td id="frmTitle" name="frmTitle" nowrap="nowrap" valign="middle" align="center"
                width="115" style="border-right: 1px solid #000000">
                <iframe name="BoardTitle" style="height: 100%; visibility: inherit; width: 100%;
                    z-index: 2" scrolling="no" frameborder="0" src="Menu1.aspx"></iframe>
            </td>
            <td style="width: 10pt" bgcolor="#7898A8" width="10" title="关闭/打开左栏" class="navPoint">
                <table border="0" cellpadding="0" cellspacing="0" width="11" height="100%" align="right">
                    <tr>
                        <td valign="middle" align="right" class="middleCss">
                            <img border="0" src="images/Menu/close.gif" id="menuimg" alt="隐藏左栏" onmouseover="javascript: menuonmouseover();"
                                onmouseout="javascript: menuonmouseout();" onclick="javascript:switchSysBar()"
                                style="cursor: hand" width="11" height="76" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 100%">
               <iframe id="Iframe" name="mainFrame" style="height: 100%; visibility: inherit; width: 100%;
                    z-index: 1" scrolling="auto" frameborder="0" src="mylogin.aspx"></iframe>
            </td>
        </tr>
        <%
            break;
        case 2:
        %>
        <tr>
            <td height="51px">
                <iframe name="MainTop" style="height: 100%; visibility: inherit; width: 100%; z-index: 1"
                    scrolling="no" frameborder="0" src="Menu2.aspx"></iframe>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <iframe id="Iframe" name="mainFrame" style="height: 100%; visibility: inherit; width: 100%;
                    z-index: 1" scrolling="auto" frameborder="0" src="mylogin.aspx"></iframe>
            </td>
        </tr>
        <%
            break;
            case 3:
        %>
        <tr>
            <td id="frmTitle" name="frmTitle" nowrap="nowrap" valign="middle" align="center"
                width="198" style="border-right: 1px solid #000000">
                <iframe name="BoardTitle" style="height: 100%; visibility: inherit; width: 198; z-index: 2"
                    scrolling="auto" frameborder="0" src="Menu3.aspx"></iframe>
            </td>
            <td style="width: 10pt" bgcolor="#7898A8" width="10" title="关闭/打开左栏" class="navPoint">
                <table border="0" cellpadding="0" cellspacing="0" width="11" height="100%" align="right">
                    <tr>
                        <td valign="middle" align="right" class="middleCss">
                            <img border="0" src="images/Menu/close.gif" id="menuimg" alt="隐藏左栏" onmouseover="javascript: menuonmouseover();"
                                onmouseout="javascript: menuonmouseout();" onclick="javascript:switchSysBar()"
                                style="cursor: hand" width="11" height="76" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 100%">
                <iframe id="Iframe" name="mainFrame" style="height: 100%; visibility: inherit; width: 100%;
                    z-index: 1" scrolling="auto" frameborder="0" src="mylogin.aspx"></iframe>
            </td>
        </tr>
        <%
            break;
    }
        %>
    </table>
</body>
</html>
<script language="JavaScript" type="text/javascript">

    var DispClose = true;

    function CloseEvent() {
        if (DispClose) {
            return "是否离开当前页面?";
        }
    }
    //window.onbeforeunload=CloseEvent;
    rnd.today = new Date();

    rnd.seed = rnd.today.getTime();

    function rnd() {
        rnd.seed = (rnd.seed * 9301 + 49297) % 233280;
        return rnd.seed / (233280.0);

    };

    function rand(number) {
        return Math.ceil(rnd() * number);

    };

    function AlertMessageBox(Messages) {
        DispClose = false;
        alert(Messages);
        setTimeout("reload()", 100)
        //window.location.reload();
        //window.location.href = location.href+"?"+rand(1000000);

    }
    function reload() {
        window.location.href = location.href + "?" + rand(1000000);
    }

    var var_frmTitle = document.getElementById("frmTitle");
    var var_menuimg = document.getElementById("menuimg");

    function switchSysBar() {

        if (var_frmTitle.style.display == "none") {
            var_frmTitle.style.display = ""
            var_menuimg.src = "images/Menu/close.gif";
            var_menuimg.alt = "隐藏左栏"
        }
        else {
            var_frmTitle.style.display = "none"
            var_menuimg.src = "images/Menu/open.gif";
            var_menuimg.alt = "开启左栏"
        }



    }

    function menuonmouseover() {
        if (var_frmTitle.style.display == "none") {
            var_menuimg.src = "images/Menu/open_on.gif";
        }
        else {
            var_menuimg.src = "images/Menu/close_on.gif";
        }
    }
    function menuonmouseout() {
        if (var_frmTitle.style.display == "none") {
            var_menuimg.src = "images/Menu/open.gif";
        }
        else {
            var_menuimg.src = "images/Menu/close.gif";
        }
    }
    if (top != self) {
        top.location.href = "default.aspx";
    }
   
</script>
<script language="javascript">
    //setTimeout("self.location.reload();",1000);
    window.setInterval('showTime()', 1000)
    function showTime() {
        var enabled = 0;
        today = new Date();
        var day;
        var date;
        if (today.getDay() == 0) day = "星期日"
        if (today.getDay() == 1) day = "星期一"
        if (today.getDay() == 2) day = "星期二"
        if (today.getDay() == 3) day = "星期三"
        if (today.getDay() == 4) day = "星期四"
        if (today.getDay() == 5) day = "星期五"
        if (today.getDay() == 6) day = "星期六"
        date = (today.getYear()) + "年" + (today.getMonth() + 1) + "月" + today.getDate() + "日 " +
day + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds() + "   ";
        //document.getElementById("time").innerHTML = date;
    }
</script>
 
