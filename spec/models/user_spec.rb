require "rails_helper"

RSpec.describe User, :type => :model do
  it "has an email" do
    user = User.new(email: "abcd@abcd.com")
    expect(user.email).to eq "abcd@abcd.com"
  end

  it "has an access_token on create" do
    user = User.create(email: "abcd@abcd.com")
    expect(user.access_token).to be_kind_of String
  end
end
