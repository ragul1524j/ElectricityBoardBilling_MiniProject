using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using ElectricityBoardBilling.Backend;

namespace ElectricityBoardBilling
{
    public partial class AddElectricityBill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAddBill_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblResult.Text = "Please correct the highlighted validation errors before submitting.";
                lblResult.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                
                string consumerNumber = txtConsumerNumber.Text.Trim();
                string consumerName = txtConsumerName.Text.Trim();
                int units = int.Parse(txtUnits.Text.Trim());

             
                if (!Regex.IsMatch(consumerNumber, @"^EB\d{5}$"))
                {
                    lblResult.Text = "Consumer Number must be in the format EB12345.";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                
                if (units < 0)
                {
                    lblResult.Text = "Given units is invalid";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                    return;
                }

               
                ElectricityBill ebill = new ElectricityBill
                {
                    ConsumerNumber = consumerNumber,
                    ConsumerName = consumerName,
                    UnitsConsumed = units
                };

               
                ElectricityBoard board = new ElectricityBoard();
                board.CalculateBill(ebill);

            
                bool isInserted = board.AddBill(ebill);

               
                if (isInserted)
                {
                    lblResult.Text =
                        "Consumer Number : " + ebill.ConsumerNumber + "<br/>" +
                        "Consumer Name : " + ebill.ConsumerName + "<br/>" +
                        "Units Consumed : " + ebill.UnitsConsumed + "<br/>" +
                        "Bill Amount : " + ebill.BillAmount + "<br/><br/>" +
                        "✔ Bill inserted successfully into database";

                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                   
                    lblResult.Text = "❌ Bill calculation done but failed to save into database.";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
              
                lblResult.Text = "Error occurred : " + ex.Message;
                lblResult.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
