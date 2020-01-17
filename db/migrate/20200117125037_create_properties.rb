class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.string :address
      t.string :status, :default => 'available'
      t.string :description
      t.integer :price
      t.float :latt
      t.float :long


      t.timestamps
    end
  end
end
