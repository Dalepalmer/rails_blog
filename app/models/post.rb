class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :entry, :presence => true
  validates :title, :presence => true
  validates :date, :presence => true


end
