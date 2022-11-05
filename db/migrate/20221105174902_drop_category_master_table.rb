class DropCategoryMasterTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :category_masters
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
