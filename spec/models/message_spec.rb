require 'rails_helper'
require 'vcr'

describe Message do
  it "doesn't save the message if there is an error" do
    message = Message.create(:body => "hi", :to => '1111111', :from => '+15005550006')
    expect(message.save).to be false
  end
  describe "#send", :vcr => true do
    it "sends a text message to the given phone number" do
      message = Message.create(:body => "hi", :to => '11111111', :from => '+15005550006')
      expect("sent").to eq("sent")
    end
  end
end
