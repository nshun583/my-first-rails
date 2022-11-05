class CreateCategoryMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :category_masters do |t|
      t.string :category
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :category_masters, :discarded_at
  end
end
