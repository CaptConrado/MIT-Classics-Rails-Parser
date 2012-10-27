class AddingOrderToParagraphs < ActiveRecord::Migration
  def up
  	add_column(:paragraphs, :order_number, :integer)
  end

  def down
  	remove_column(:paragraphs, :order_number)
  end
end
