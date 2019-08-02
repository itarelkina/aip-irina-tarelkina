require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it 'ensure email presence' do
    user = User.new(email: 'sample@example.com', encrypted_password: 'password').save
    expect(user).to eq(false)
    end
  end
end