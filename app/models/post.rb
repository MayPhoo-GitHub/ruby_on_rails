class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates_inclusion_of :public_flag, :in => [true, false]
end
