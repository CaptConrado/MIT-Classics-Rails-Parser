class Paragraph < ActiveRecord::Base
  attr_accessible :content, :order_number , :chapter

  belongs_to :chapter

end
