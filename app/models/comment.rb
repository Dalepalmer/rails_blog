class Comment < ActiveRecord::Base
  belongs_to :post

  validates :username, :presence => true
  validates :description, :presence => true
  after_save :send_message

private

  def send_message
    if self.post.user.phone
    begin
      response = RestClient::Request.new(
      method: :post,
      url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      user: ENV['TWILIO_ACCOUNT_SID'],
      password: ENV['TWILIO_AUTH_TOKEN'],
      payload: {  Body: "User #{self.username} just commented on your post",
                  To: self.post.user.phone,
                  From: ENV['TWILIO_NUMBER'] }
        ).execute
      rescue
        false
      end
    end
  end
end
