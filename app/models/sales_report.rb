class SalesReport < ApplicationRecord
  belongs_to :partner

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    header = map_to_db_columns(header)
    # binding.pry
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      sale = find_by_id(row['id']) || new
      sale.attributes = row.to_hash.slice(*accessible_attributes)
      sale.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.map_to_db_columns(header)
    binding.pry
  end
end
