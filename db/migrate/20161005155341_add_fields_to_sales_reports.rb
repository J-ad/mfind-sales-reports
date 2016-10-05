class AddFieldsToSalesReports < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_reports, :written_premiums, :integer
    add_column :sales_reports, :policy_number, :integer
    add_column :sales_reports, :renewal, :boolean
    add_column :sales_reports, :insurer, :string
    add_column :sales_reports, :policy_premium, :integer
    add_column :sales_reports, :commission_percent, :integer
    add_column :sales_reports, :commission_ammount, :integer
    add_column :sales_reports, :comments, :string
    add_column :sales_reports, :token, :string
    add_column :sales_reports, :registration_number, :string
    add_column :sales_reports, :calculation_token, :string
    add_column :sales_reports, :salesforce_id, :string
  end
end
