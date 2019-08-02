class Record < ApplicationRecord
belongs_to :letter
belongs_to :user
#attr_accessible :letter_id, :name, :unit_value, :quantity, :template, :user_id
validates :name, presence: true
validates :unit_value, presence: true
validates :template, presence: true
def full_price
    unit_value*quantity
end

def self.to_csv(options = {})
    CSV.generate(options) do |csv|
    csv << column_names
    all.each do |record|
        csv << record.attributes.values_at(*column_names)
    end
  end
end

def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    Record.create! row.to_hash
  
  end
end

# def self.import(file)
#   spreadsheet = open_spreadsheet(file)
#   header = spreadsheet.row(1)
#   (2..spreadsheet.last_row).each do |i|
#     row = Hash[[header, spreadsheet.row(i)].transpose]
#     record = find_by_id(row["id"]) || new
#     record.attributes = row.to_hash.slice(*accessible_attributes)
#    record.save!
#   end
# end


def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
end
end
