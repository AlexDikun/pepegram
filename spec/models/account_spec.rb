require 'rails_helper'

RSpec.describe Account, type: :model do
=begin
  context "sign up" do
    # fix
    it "valid_password?" do
      acc = Account.new(encrypted_password: "1234567890")
      expect(acc.valid_password? "1234567890" ).to true
    end
  end
=end
end
