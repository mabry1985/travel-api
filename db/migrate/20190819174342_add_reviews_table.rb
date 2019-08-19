class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :content
      t.integer :rating

      t.belongs_to :destination, foreign_key: true
      t.timestamps
    end
  end
end
