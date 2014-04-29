class ChangeColumnNamesTopic < ActiveRecord::Migration
  def change
    rename_column :topics, :description, :title
    add_column :topics, :poster, :string
  end
end
