class RegenerateCategories < ActiveRecord::Migration[7.0]
  def up
    drop_table :categories
    create_table :categories, id: false do |t|
      t.bigint :category_id, primary_key: true
      t.string :category
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :categories, :discarded_at
  end

  def down
    drop_table :categories
    create_table :categories do |t|
      t.string :category
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :categories, :discarded_at
  end
end
