class CreateArticlesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_categories do |t|
      t.bigint :article_id
      t.bigint :category_id

      t.timestamps
    end
    add_index :articles_categories, :article_id
    add_index :articles_categories, :category_id
  end
end