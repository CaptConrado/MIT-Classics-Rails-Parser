class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :order_number
      t.string :title
      t.text :summary
     
      t.timestamps
    end
  end
end
