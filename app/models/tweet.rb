class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, :uniqueness => true, :length => { :minimum => 5 }
end
