class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :serial
      t.string :name
      t.string :manufacturer
      t.string :ubt_serial
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
