class Post < ActiveRecord::Base
  has_many :comments

  validates :entry, :presence => true
  validates :title, :presence => true
  validates :date, :presence => true



end
