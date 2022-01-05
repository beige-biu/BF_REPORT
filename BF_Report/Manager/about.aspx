<%@ Page Language="C#" MasterPageFile="~/Manager/MasterPage/PageTemplate.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="FrameWork.web.about"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageBody" runat="server">
<table border=0 cellpadding=0 cellspacing=0 width="100%">
  <tr> 
    <td height="43" bgcolor="#ffffff" colspan="2" ><b><font size="2" color="#999999" face="Verdana, Arial, Helvetica, sans-serif"><asp:Label ID="SystemName" runat="server"></asp:Label></font></b></td>
  </tr>
  <tr> 
    <td height=1 bgcolor=#000000 colspan="2"></td>
  </tr>
  <tr>       
    <td height=80 colspan="2"> 
      <table border=0 cellpadding=0 cellspacing=10 width="100%">
        <tr> 
          <td width="50%" valign="top">
          <font color="#000000" face="Verdana, Arial, Helvetica, sans-serif" size="2">承接单位 
             
          </font>
           <br />
           <br />
          <font  face="Verdana, Arial, Helvetica, sans-serif" size="2">
                
                <span style="mso-field-code: &quot; DOCPROPERTY  EMS-Customer-Name  \\* MERGEFORMAT &quot;; color: #000000; font-size: large;" 
                  lang="AR-SA">金自天正
                </span>
           </font>
         </td>
          <td width="50%" valign="top">
          <font color="#000000" font face="Verdana, Arial, Helvetica, sans-serif" size="2">使用单位
                </font>
           <br />
           <br />
            <font  face="Verdana, Arial, Helvetica, sans-serif" size="2">
                <span style="mso-field-code: &quot; DOCPROPERTY  EMS-Customer-Name  \\* MERGEFORMAT &quot;; color: #000000; font-size: large;" 
                  lang="AR-SA">兴澄特钢
              </span>
            </font>
               			
            </td>
        </tr>
        <tr> 
          <td colspan="2" align="right" style="height: 28px"> &nbsp;<input type=button 
                  value="确定" onClick="window.top.hidePopWin();" name="button" class="button_bak"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</asp:Content>
 
