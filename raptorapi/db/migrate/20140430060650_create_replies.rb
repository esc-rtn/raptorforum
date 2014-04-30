class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.string :poster
      t.references :topic, index: true

      t.timestamps
    end
  end
end
