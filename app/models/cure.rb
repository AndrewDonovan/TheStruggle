class Cure
  include Mongoid::Document
  field :item, type: String
  field :amount, type: String
  field :order, type: String
  field :lastnight, type: String

  belongs_to :person
end
