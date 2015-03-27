require 'rails_helper'

describe "the add a post process" do
    let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "adds a new post" do
    visit new_post_path
    fill_in 'Title', with: 'Test Shot'
    fill_in 'Entry', with: 'Test Pull'
    click_on 'Post'
    expect(page).to have_content 'Your post has'
  end

  it "gives error when no title is entered" do
    visit new_post_path
    fill_in 'Title', :with=> ''
    click_on 'Post'
    expect(page).to have_content 'a problem'
  end

  it "gives error when no entry is entered" do
    visit new_post_path
    fill_in 'Entry', :with=> ''
    click_on 'Post'
    expect(page).to have_content 'a problem'
  end
end
