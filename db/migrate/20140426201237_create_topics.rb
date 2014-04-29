class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :description
      t.string :content
      t.datetime :postdate

      t.timestamps
    end
  end
end
