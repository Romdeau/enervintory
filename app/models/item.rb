# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  serial       :string(255)
#  name         :string(255)
#  manufacturer :string(255)
#  ubt_serial   :string(255)
#  description  :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Item < ActiveRecord::Base
  belongs_to :user
  has_many :software

  validates :serial, uniqueness: true,
    unless: :blank_serial?

  def blank_serial?
    if serial == nil or serial == ''
      true
    else
      false
    end
  end

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
