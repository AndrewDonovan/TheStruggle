class Cure
  include Mongoid::Document
  include Mongoid::Paperclip
  field :item, type: String
  field :amount, type: String
  field :order, type: String
  field :lastnight, type: String

  has_mongoid_attached_file :image


  belongs_to :person

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
