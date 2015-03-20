require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit new_post_path
    fill_in 'Title', :with => 'Test Shot'
    fill_in 'Entry', :with => 'Test Pull'
    fill_in 'Date', :with => '05/31/1987'
    click_on 'Create Post'
    save_and_open_page
    expect(page).to have_content 'Post has been'
  end

  # it "gives error when no title is entered" do
  #   visit new_post_path
  #   fill_in 'Title', :with=> ''
  #   click_on 'Create Post'
  #   expect(page).to have_content 'Post has been'
  # end
end
