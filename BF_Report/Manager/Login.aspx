<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Login.aspx.cs" Inherits="FrameWork.web.Login" %>

<html>
<head>
    

    <script language="javascript" src="js/checkform.js"></script>
    <style>
        .bg {
            width:100%;
            height:100%;
            background-image:url(images/bg.png);
            background-repeat:no-repeat;
            background-size:100% 100%;
            position:absolute;
            box-shadow:2px 2px 5px #000;
            overflow:hidden;
            
           
        }
        a {
            font-weight:700;
            text-decoration:none;
            color:#fff;
            /*font-family:'Lucida Calligraphy';*/
            /*font-family:'Script MT'*/
            /*font-family:sans-serif;*/
        }
        
        </style>
        <script>
            function goBack() {
                window.opener=null;
                window.open('','_self');
                window.close();
        </script>

    <title>
        <%=FrameName %>
    </title>
    <link rel="icon" href="images/icon/Colume.png" type="image/x-icon"> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    
</head>
<div class="bg">
<div class="bg">
    <div style="width:600px;height:600px; position:absolute;right:56%;top:3%">

        
           <%--<img src="images/111.jpg" alt="Alternate Text" style="width:600px;"/>--%>
           <img src="images/222.png" alt="Alternate Text" style="width:600px;"/>
        
    </div>
    
    <div style="width: 450px;height: 345px;background:rgba(0,0,0,0.1);position: absolute;right: 15%;top: 22%; border-radius: 7px;">
        <form style="margin-top:15%" name="login" method="post" runat="server" defaultfocus="LoginName" onsubmit="javascript:return checkForm(this)">
                                    
                                       <div style="width:100%;">                                        
                                           <%--<img src="images/liantie2.png" alt="Alternate Text" style="width:210px;margin-left:28%;margin-bottom:-3%;margin-top:-4%"/>--%>
                                           <img src="images/liantie3.png" alt="Alternate Text" style="width:220px;margin-left:33%;margin-bottom:-3%;margin-top:-4%"/>                                      
                                           <%--<img src="images/ziti2.png" alt="Alternate Text" style="width:320px;margin-left:16%;margin-bottom:0%;margin-top:18px;"/>--%>
                                           <p style="font-family:STHupo;font-size:24pt;font-weight:300;margin-left:24%;color:#fff;">铁前数据展示平台</p>
                                       </div>
                                    
                                <table style="width:100%;margin-left:2%;margin-top:-3%" border="0" cellpadding="0" cellspacing="0" align="center" >
                                    <tr style="width:100%">
                                        <td style="width:184px !important;">
                                            <label style="font-family:YouYuan;font-size:16px;font-weight:800;color:#fff;margin-left:113px">账号：</label>
                                        </td>
                                        
                                        <td>
                                            <asp:TextBox ID="LoginName" class="text_input"  runat="server" CssClass="auto-style1" Width="150px" style="font-size:16px;border-radius:2px;"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="4">
                                                    </td>
                                    </tr>
                                    <tr>
                                        <td style="width:184px !important;">
                                            <label style="font-family:YouYuan;font-size:16px;font-weight:800;color:#fff;margin-left:113px">密码：</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="LoginPass" runat="server"  title="请输入密码~!" TextMode="Password" CssClass="auto-style1" Width="150px" style="font-size:16px;border-radius:2px;"></asp:TextBox>
                                        </td>
                                    </tr>
                                   
                                   <%-- <tr>
                                         <td>
                                              <asp:Button ID="Button1" disabled="disabled" runat="server" Text="登录" class="button_bak"
                                                            OnClick="Button1_Click" />
                                               <input id="Button2" type="reset" value="重填" class="button_bak" />
                                           </td>
                                    </tr>--%>
                                                                            
                                       <table border="0" cellpadding="0" cellspacing="0">
                                                <div id="inputcode_op" runat="server">
                                                <tr>
                                                    <td height="2">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img
                                                            src="" onload="javascript:Open_Submit();" id="ImageCheck" align="absmiddle" style="cursor: pointer"
                                                            width="138" height="35" onclick="javascript:ChangeCodeImg();" title="点击更换验证码图片!" />
                                                    </td>
                                                </tr>
												<tr><td>
												<asp:TextBox ID="code_op" class="text_input" runat="server" Columns="6" title="请输入输入上图中显示的字母~!"></asp:TextBox>
												<font color="red">输入上图中显示的字母。</font></td></tr>
                                                </div>
                                               
                                            </table>
                                        
                                    </tr>
                                 
                                </table>
            
            <div style="width: 100%; margin-top: 2%">

                <tr>
                    <td style="width: 1600px !important;">
                        <label style="font-family: YouYuan; font-size: 13px; font-weight: 800; color: black; margin-left: 113px">注意:用户名或密码中的字母请用小写</label>
                    </td>

                </tr>
            </div>


            <div style="width: 100%; margin-top: 3%">
                <asp:button id="Button1" disabled="disabled" runat="server" text="登&nbsp;&nbsp;录" class="button_bak"
                    onclick="Button1_Click" style="width: 70px; height: 30px; margin-left: 27%; font-family: 'Microsoft YaHei'; font-weight: 700; color: #000; background-color: #cfcfcf; line-height: 22px;" />

                <%--<input type="button" value="返&nbsp;&nbsp;回" onclick="goBack()" style="width:70px;height:30px;margin-left:17%;font-family:'Microsoft YaHei';font-weight:700;color:#fff;background-color:#cfcfcf;line-height:22px;" />--%>
                <%--<button type="button"  onclick="goBack()">Close</button>--%>
                <button style="width: 70px; height: 30px; margin-left: 17%; background-color: #cfcfcf; line-height: 22px;">
                    <a style="font-family: 'Microsoft YaHei'; font-weight: 700; color: #000;" href="javascript:window.opener=null;window.open('','_self');window.close();">取消</a>
                </button>

            </div>



        </form>
    </div>
    
    <div style="position:absolute;top:67%;right:4%">

        <%--<img src="images/phone1.png" alt="Alternate Text" style="width:680px;"/>--%>
        <%--<a href="#">版权所有:@炼铁事业部计算机管理中心</a>
        <br />
        <a href="#">Powered by Computer Management Center of the Ironmaking Division</a>
        <br />
        <a href="#">联系电话：6578</a>--%>
        <img src="images/phone2.PNG" alt="Alternate Text" style="width:680px;" />
    </div>
    

</div>
   

</html>

<script language="JavaScript" type="text/javascript"><!-- 

    // The Central Randomizer 1.3 (C) 1997 by Paul Houle (houle@msc.cornell.edu) 

    // See: msc.cornell.edu/~houle/javascript/randomizer.html 

    rnd.today=new Date(); 

    rnd.seed=rnd.today.getTime(); 

    function rnd() { 

　　　　rnd.seed = (rnd.seed*9301+49297) % 233280; 

　　　　return rnd.seed/(233280.0); 

    }; 

    function rand(number) { 

　　　　return Math.ceil(rnd()*number); 

    }; 

    // end central randomizer. --> 

</script>

<script language="javascript" type="text/javascript">

    if (document.getElementById("code_op")!=null)
    {
        ChangeCodeImg();
        
    }
    else
    {
        document.getElementById("Button1").disabled = false;
    }
    //function ChangeCodeImg()
    //{
    //         a = document.getElementById("ImageCheck");
    //         a.src = "inc/CodeImg.aspx?"+rand(10000000);
    //         document.getElementById("Button1").disabled = true;
    //}
    
    function Open_Submit()
    {
        document.getElementById("Button1").disabled = "";
    }
    
    if(top!=self)
    {
        top.location.href = "login.aspx";
    }
    //alert(navigator.appVersion);
    if(navigator.appVersion.indexOf("MSIE")   ==   -1   ){   
        //alert("提醒 : 本管理系统建议议采用Internet Explorer 5.5 (或以上版本) 的浏览器。请开启浏览器的 Cookies 与 JavaScript 功能。");   
    }   
    
</script>

 
