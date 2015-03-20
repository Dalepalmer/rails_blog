class Comment < ActiveRecord::Base
  belongs_to :post

  validates :username, :presence => true
  validates :description, :presence => true
end
