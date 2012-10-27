class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.string :content
      t.integer :order_number

      t.timestamps
    end
  end
end
