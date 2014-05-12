class Person
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :age, type: String

  has_many :cures
end
