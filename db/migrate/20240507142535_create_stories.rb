class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :body
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
