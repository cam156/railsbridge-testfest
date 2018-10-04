module PostsHelper
  def find_user_email(id)
    @user = User.find(id)
    @user.email
  end

  def initiate_twilio_client
    account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    auth_token = "your_auth_token"
    Twilio::REST::Client.new account_sid, auth_token
  end

  def sent_text_to_user(client: client, number: number, text: text)
    result = client.messages.create(
        body: text,
        to: number,
        from: "+12345678901")
    { status: result.status }.to_json
  end

end
