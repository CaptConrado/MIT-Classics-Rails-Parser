class Page < ActiveRecord::Base
  attr_accessible :body, :title

  has_many :paragraphs
end
