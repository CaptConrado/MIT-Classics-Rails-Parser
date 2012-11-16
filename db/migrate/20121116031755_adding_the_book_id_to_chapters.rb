class AddingTheBookIdToChapters < ActiveRecord::Migration
  def up
  	add_column :chapters, :book_id, :integer
  end

  def down
  	remove_column :chapters, :book_id
  end
end
