class Item < ActiveRecord::Base
  belongs_to :user

  validates :serial, uniqueness: true

  def self.to_csv
    CSV.generate do |csv|
      @header = %w{serial name manufacturer ubt_serial description}
      csv << @header
      all.each do |item|
        csv << item.attributes.values_at("serial", "name", "manufacturer", "ubt_serial", "description")
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      @item = Item.new(row.to_hash)
      @item.save
    end
  end

end
