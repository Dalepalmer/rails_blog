require 'rails_helper'

describe Comment do
  it {should belong_to :post }
  it {should validate_presence_of :username}
  it {should validate_presence_of :description}
end
