require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    post = Post.create(:title => 'Test Shot', :entry => 'Test Pull', :date => '05/31/1987')
    visit new_post_comment_path(post)
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
