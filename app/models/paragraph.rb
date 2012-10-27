class Paragraph < ActiveRecord::Base
  attr_accessible :content, :order_number

  belongs_to :chapter

end
