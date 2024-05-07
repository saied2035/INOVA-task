class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.string :comment
      t.references :story, foreign_key: true, index: true
      t.timestamps
    end
  end
end
