<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CascadingDDLDemo.index" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>

        function callFunction() {
            alert('hello');

            var selectedItem = $('#DropDownList1').children("option:selected").val();
            alert(selectedItem)
            $.ajax({
                type: "POST",
                url: "ViewSIP.aspx/ddlPayoutPeriod_SelectedIndexChanged()",
                data: $('#PayoutPeriod').serialize(),
                success: function (response) {
                    console.log(response)
                },
                Error: function (err) {
                    console.log(err)
                }
            });
        }

        function callFunction1() {
            alert('hello1');

            var selectedItem = $('#PayoutPeriod').children("option:selected").val();
            $('#hdnDDValue').val = selectedItem;
            alert(selectedItem)
            $.ajax({
                type: "POST",
                url: "index.aspx/calling",
                data: selectedItem,
                success: function (response) {
                    alert("success");
                    console.log(response)
                },
                Error: function (err) {
                    alert("Erro");
                    console.log(err)
                }
            });
        }

        function ShowCurrentTime() {
            var selectedItem = $('#DropDownList1').children("option:selected").val();
            $.ajax({
                type: "POST",
                url: "index.aspx/GetCurrentTime",
                data: '{name: "' + selectedItem + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }
    </script>
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" onChange="ShowCurrentTime()" DataTextField="CountryName" DataValueField="CountryID"></asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataTextField="StateName" DataValueField="StateID"></asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList3" runat="server" DataTextField="CityName" DataValueField="CityID"></asp:DropDownList>
            <asp:HiddenField ID="hdnDDValue" runat="server" />
            <select class="PayoutPeriod" id="PayoutPeriod" onchange="ShowCurrentTime()">
                <option value="H1">H1</option>
                <option value="Full Year">Full Year</option>
            </select>
        </div>
    </form>
</body>
</html>