class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :serial
      t.string :notes
      t.references :item, index: true

      t.timestamps
    end
  end
end
