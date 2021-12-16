class Post < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates_inclusion_of :public_flag, :in => [true, false]
end
