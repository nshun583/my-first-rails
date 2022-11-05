class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :categories, :discarded_at
  end
end
