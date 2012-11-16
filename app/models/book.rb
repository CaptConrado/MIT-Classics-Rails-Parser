class Book < ActiveRecord::Base
  attr_accessible :author, :name, :title, :doc
  has_attached_file :doc

  has_many :chapters

  def parse!


        entire_book_text = File.open(open(doc.path)).read #This opens the file and places it into an Array

        
        chapters_array = entire_book_text.split("----------------------------------------------------------------------")

        #cleans up a little
        chapters_array.pop
        chapters_array.shift

        #eachchapter = chapters_cho

        #eachchapter.each_with_index do |chap,book|
        #puts book + 1
        #puts chap
        #end

        #loop that takes the pieces and place them on the correct place in DB
        chapters_array.each_with_index do |chapter_text,chapter_number|
          chapter = Chapter.create(order_number: chapter_number+1, summary: chapter_text, book: self) #han added
          
          paragraphs = chapter_text.split("\n\n")


          paragraphs.each_with_index do |paragraph_text,paragraph_number|
            Paragraph.create!(order_number: paragraph_number+1, content: paragraph_text, chapter: chapter)

            logger.info "------- #{paragraphs.count} number"
            logger.info "+++++++  #{paragraphs}" 
        end
       end


  end


end
