<%@ Page Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ViewLastNBills.aspx.cs"
    Inherits="ElectricityBoardBilling.ViewLastNBills" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="MainContent"
    runat="server">

<div class="billing-card">

    <h3 class="card-title">View Last N Bills</h3>

    <div class="form-group">
        <label class="form-label">Enter number of bills</label>

        <asp:TextBox ID="txtCount"
            runat="server"
            CssClass="input-box" />

        <div class="validation-msg">
            <asp:RequiredFieldValidator
                runat="server"
                ControlToValidate="txtCount"
                ErrorMessage="Enter number of bills"
                CssClass="error"
                Display="Dynamic" />
        </div>
    </div>

    <div style="text-align:center; margin-top:15px;">
        <asp:Button ID="btnView"
            runat="server"
            Text="View Bills"
            CssClass="btn-submit"
            OnClick="btnView_Click" />
    </div>

    <br />

    <asp:GridView ID="gvBills"
        runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-bordered"
        Visible="false">

        <Columns>
            <asp:BoundField HeaderText="Consumer Number" DataField="ConsumerNumber" />
            <asp:BoundField HeaderText="Consumer Name" DataField="ConsumerName" />
            <asp:BoundField HeaderText="Units Consumed" DataField="UnitsConsumed" />
            <asp:BoundField HeaderText="Bill Amount" DataField="BillAmount" />
        </Columns>

    </asp:GridView>

</div>

</asp:Content>
