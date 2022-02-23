class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.float :price, null: false

      t.timestamps
      t.index :code
    end
  end
end
