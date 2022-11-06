class RegenerateArticlesCategories < ActiveRecord::Migration[7.0]
  def up
    drop_table :articles_categories
    create_table :articles_categories, id: false do |t|
      t.bigint :article_id
      t.bigint :category_id, primary_key: true

      t.timestamps
    end
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end

  def down
    drop_table :articles_categories
    create_table :articles_categories do |t|
      t.bigint :article_id
      t.bigint :category_id

      t.timestamps
    end
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end
end
