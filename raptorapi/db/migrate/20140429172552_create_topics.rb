class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :content
      t.string :poster

      t.timestamps
    end
  end
end
