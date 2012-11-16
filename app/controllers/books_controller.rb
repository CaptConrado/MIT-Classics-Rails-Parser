class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book]) # Passes in the parameter from the new view 

    respond_to do |format|
      if @book.save

        logger.info " book id = #{@book.id}" #han added

        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }


        open_book = @book
        entire_book_text = File.open(open(open_book.doc.path)).read #This opens the file and places it into an Array

        
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
          chapter = Chapter.create(order_number: chapter_number+1, summary: chapter_text, book: @book) #han added
          
          paragraphs = chapter_text.split("\n\n")


          paragraphs.each_with_index do |paragraph_text,paragraph_number|
            Paragraph.create!(order_number: paragraph_number+1, content: paragraph_text, chapter: chapter)

            logger.info "------- #{paragraphs.count} number"
            logger.info "+++++++  #{paragraphs}" 

          end
        end


      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
