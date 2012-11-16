class Chapter < ActiveRecord::Base
  attr_accessible :order_number, :summary, :title , :book

  belongs_to :book
  has_many :paragraphs
  
end
