class Chapter < ActiveRecord::Base
  attr_accessible :order_number, :summary, :title

  has_one :book
  has_many :paragraphs
  
end
