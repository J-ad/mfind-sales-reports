# == Schema Information
#
# Table name: sales_reports
#
#  id                  :integer          not null, primary key
#  partner_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  written_premiums    :integer
#  policy_number       :integer
#  renewal             :boolean
#  insurer             :string(255)
#  policy_premium      :integer
#  commission_percent  :integer
#  commission_ammount  :integer
#  comments            :string(255)
#  token               :string(255)
#  registration_number :string(255)
#  calculation_token   :string(255)
#  salesforce_id       :string(255)
#

class SalesReport < ApplicationRecord
  belongs_to :partner

  def self.import(file)
    binding.pry
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      sale = find_by_id(row["id"]) || new
      sale.attributes = row.to_hash.slice(*accessible_attributes)
      sale.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
end
end
