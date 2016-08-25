require 'rails_helper'

describe User do

  let(:user){ build(:user) }

  it "is valid with default attributes" do
    expect(user).to be_valid
  end

  it "has a secure password" do
    is_expected.to have_secure_password
  end

  it "has password between 8 and 24 characters" do
    should validate_length_of(:password).is_at_least(8).is_at_most(24)
  end

end