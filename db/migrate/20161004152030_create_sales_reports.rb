class CreateSalesReports < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_reports do |t|
      t.references :partner, foreign_key: true

      t.timestamps
    end
  end
end
