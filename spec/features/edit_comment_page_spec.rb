require 'rails_helper'

describe "the add a comment process" do
    let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "adds a new comment" do
    visit new_post_path
    fill_in 'Title', :with => 'Test Shot'
    fill_in 'Entry', :with => 'Test Pull'
    click_on 'Post'
    click_on 'Add a Comment'
    fill_in 'Description', :with => 'super comment'
    click_on 'Post Comment'
    click_on 'Edit Comment'
    fill_in 'Description', :with => 'new test'
    click_on 'Edit comment'
    expect(page).to have_content 'updated'
  end
end
