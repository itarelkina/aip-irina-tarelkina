class Letter < ApplicationRecord
    belongs_to :user
    has_many :records
  
    def total_price
      # convert to array so it doesn't try to do sum on database directly
      records.to_a.sum(&:full_price)
    end  
end
