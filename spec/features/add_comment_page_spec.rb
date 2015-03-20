require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    visit new_post_path
    fill_in 'Title', :with => 'Test Shot'
    fill_in 'Entry', :with => 'Test Pull'
    fill_in 'Date', :with => 05/31/1987
    click_on 'Post'
    comment = Comment.create(:username => 'Dale', :description => 'Test comment')
    expect(page).to have_content 'Comment has been'
  end

  # it "gives error when no title is entered" do
  #   visit new_post_path
  #   fill_in 'Title', :with=> ''
  #   click_on 'Create Post'
  #   expect(page).to have_content 'Post has been'
  # end
end
