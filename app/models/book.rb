class Book < ActiveRecord::Base
  attr_accessible :author, :name, :title, :doc
  has_attached_file :doc

  has_many :chapters
end
