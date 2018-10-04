require "rails_helper"

describe PostsHelper do
  describe "#find_user_email" do
    let(:user) { User.new( email: 'user@gmail.com',password: 'shhhhh!') }
    it "returns an email" do
      user.save
      expect(helper.find_user_email(user.id)).to eq("user@gmail.com")
    end

    it "initiates a Twilio client" do
      client = helper.initiate_twilio_client
      expect(client).to be_an_instance_of(Twilio::REST::Client)
    end

    it "sends a text" do

      stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages.json").
          with(:body => {"Body"=>"hello world", "From"=>"+12345678901", "To"=>"+12017350535"},
               :headers => {'Accept'=>'application/json', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Basic QUNYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWDp5b3VyX2F1dGhfdG9rZW4=', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'twilio-ruby/5.10.0 (ruby/x86_64-darwin17 2.2.4-p230)'}).
          to_return(:status => 200, :body => "", :headers => {})
      
      client = helper.initiate_twilio_client

      @number = '+12017350535' #enter your phone number here
      response = JSON.parse(helper.sent_text_to_user(client: client, number: @number, text: 'hello world'))
      expect(response).to be_an_instance_of(Hash)
    end
  end
end
