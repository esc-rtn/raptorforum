class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :topic_id
      t.string :content
      t.datetime :postdate

      t.timestamps
    end
  end
end
