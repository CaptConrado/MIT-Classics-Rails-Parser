require 'test_helper'

class BookTest < ActiveSupport::TestCase
   # test "the truth" do
   #   assert true
   # end


   # test "false" do
   # 		assert !false
   # end




   test "add a book" do
   			
   		assert Book.all.empty?

   		Book.create 
   			
   			assert !Book.all.empty? 

   end

	
	test "book parses" do
		book = Book.create
		book.doc = File.open "test/fixtures/support/meditation_short.txt" 
		book.save!
		book.parse!
		assert_equal 12, book.chapters.count
		assert_equal 20, book.chapters.first.paragraphs.count 
	end






end
