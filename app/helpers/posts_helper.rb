module PostsHelper
  def find_user_email(id)
    @user = User.find(id)
    @user.email
  end

  def initiate_twilio_client
    Twilio::REST::Client.new()
  end

  def sent_text_to_user(client, number)
    response = client.api.account.messages.create(
        from: '+14159341234',
        to: number,
        body: 'Hey there!'
    )
    {status: response.status}.to_json
  end

end
