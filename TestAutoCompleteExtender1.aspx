<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TestAutoCompleteExtender1.aspx.cs" Inherits="TestAutoCompleteExtender1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <script type = "text/javascript">
        function Products_Populated(sender, e) {
            var products = sender.get_completionList().childNodes;
            //if (products.length > 0) {

            for (var i = 0; i < products.length; i++) {
                var product = products[i];
                var productValueArray = (product._value).split("|");
                var text = products[i].innerHTML;
                //if (isNaN((product._value).split("|")[0])) {

                //  products[i].innerHTML = "<img style ='float:none;height:50px;width:50px' src ='../ImageViewer.ashx?ProductImageId=" + "183" + "'/>" + (product._value).split("|")[1] + "</br>";
                //    return;

                //}
                //else {
                //if (!isNaN((product._value).split("|")[0])) {
                products[i].innerHTML = "<img style ='float:none;height:50px;width:50px' src ='../ImageViewer.ashx?ProductImageId=" + (product._value).split("|")[0] + "'/>" + (product._value).split("|")[1] + "</br>";
                //}

                //}
                //}

            }
            var searchText = sender.get_element().value;
            //var employees = sender.get_completionList().childNodes;

            //for (var i = 0; i < employees.length; i++) {
            //    var employee = employees[i];
                
            //    var employeeValueArray = (employee._value).split("|");

            //    //var div = document.createElement("DIV");
            //    //div.innerHTML = "<img style = 'height:50px;width:50px' src = 'photos/" + employees[i]._value + ".jpg' /><br />";
            //    //employees[i].appendChild(div);
               

            //    //var img = document.createElement("img");
            //    //img = new Image(50, 50);
            //    //img.style.cssText = "float:left;";
            //    //img.src = " ../ImageViewer.ashx?ProductImageId=" + imageid;
            //    //employees[i].appendChild(img);

            //    //var div = document.createElement("DIV");
            //    //div.innerHTML = "<img style ='float:none;height:50px;width:50px' src ='../ImageViewer.ashx?ProductImageId=" + imageid + "'/></br>";
            //    //employees[i].appendChild(div);

            //    var text = employees[i].innerHTML;
            //    employees[i].innerHTML = "<img style ='float:none;height:50px;width:50px' src ='../ImageViewer.ashx?ProductImageId=" + (employee._value).split("|")[0] + "'/>" + (employee._value).split("|")[1] + "</br>";                      
            //}
            //var searchText = sender.get_element().value;

         }
        function OnProductSelected(source, eventArgs) {
            //var idx = source._selectIndex;
            //var employees = source.get_completionList().childNodes;
            //var value = employees[idx]._value;
            //var text = employees[idx].firstChild.nodeValue;
            //source.get_element().value = text;
            var HdnKey = eventArgs.get_value();
            document.getElementById('<%=txtContactsSearch.ClientID %>').value = HdnKey.split('|')[1];
            document.getElementById('<%=txtContactsSearch.ClientID %>').focus();
        }

    </script>
      <style>
        .AutoExtender
        {
            font-family: Verdana, Helvetica, sans-serif;
            font-size: .8em;
            font-weight: normal;
            border: solid 1px #006699;
            line-height: 20px;
            padding: 2px;
            background-color: White;
        }
        .AutoExtenderList
        {
            border-bottom: dotted 1px #006699;
            cursor: pointer;
            color: black;
        }
        .AutoExtenderHighlight
        {
            /*color: White;
            background-color: #006699;*/
            background-color:#ebedf0;
            color:#2ca01c;
            cursor: pointer;
        }
        .autocomplete_completionListElement
{
    background-color:white;
    color: windowtext;
    border-width:1px;
    border-style:solid;
    overflow:auto;
    max-height:200px;
    text-align:left;
    list-style-type:none;
    padding:0px;
}
 
    </style>
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TopSite" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                      <asp:TextBox ID="txtContactsSearch" placeholder="Tìm Kiếm Hóa Đơn, Tên Sản Phẩm, Chức Năng Sản Phẩm..."  
                            CssClass="form-control col-lg-7 pl-0 " runat="server"></asp:TextBox>
                            <%--<div id="listPlacement" style=" overflow-y:scroll;" ></div> --%>
    <%--<asp:Panel runat="server" ID="myPanel" Style="overflow-y:scroll;
        width: 50px; text-overflow: ellipsis">
    </asp:Panel>   --%>               
                            <ajaxToolkit:AutoCompleteExtender 
                             
                             MinimumPrefixLength="1" 
                             ServicePath="~/AutoComplele.aspx"
                            ServiceMethod="SearchProducts"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="txtContactsSearch" OnClientPopulated ="Products_Populated"
                            OnClientItemSelected = "OnProductSelected"    
                            ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "false"
                            CompletionListCssClass="autocomplete_completionListElement"
                            CompletionListItemCssClass="AutoExtenderList"
                            CompletionListHighlightedItemCssClass="AutoExtenderHighlight" 
                            CompletionListElementID="listPlacement">
        
                             </ajaxToolkit:AutoCompleteExtender>
    <br />
     <asp:TextBox ID="TextSearchProduct" placeholder="Tìm Kiếm Hóa Đơn, Tên Sản Phẩm, Chức Năng Sản Phẩm..."  
                            CssClass="form-control col-lg-7 pl-0 " runat="server"></asp:TextBox>
                            <%--<div id="listPlacement" style=" overflow-y:scroll;" ></div> --%>
    <%--<asp:Panel runat="server" ID="myPanel" Style="overflow-y:scroll;
        width: 50px; text-overflow: ellipsis">
    </asp:Panel>   --%>               
                            <ajaxToolkit:AutoCompleteExtender 
                             
                             MinimumPrefixLength="1" 
                             ServicePath="~/TestAutoCompleteExtender1.aspx"
                            ServiceMethod="SearchProducts"
                            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                            TargetControlID="textSearchProduct" 
                            OnClientPopulated ="Products_Populated"
                            OnClientItemSelected = "OnProductSelected"    
                            ID="AutoCompleteExtender2" runat="server" FirstRowSelected = "false"
                            CompletionListCssClass="autocomplete_completionListElement"
                            CompletionListItemCssClass="AutoExtenderList"
                            CompletionListHighlightedItemCssClass="AutoExtenderHighlight" 
                            CompletionListElementID="listPlacement">
        
                             </ajaxToolkit:AutoCompleteExtender>
                
        
        
    
</asp:Content>

