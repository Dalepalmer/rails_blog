class Comment < ActiveRecord::Base
  belongs_to :post

  validates :post_id, :presence => true
  validates :username, :presence => true
  validates :description, :presence => true

end
