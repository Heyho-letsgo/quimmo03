require 'rails_helper'

RSpec.describe User, :type => :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  it "requires a name" do
    user = User.new(name: "")

    user.valid? # populates errors

    expect(user.errors[:name].any?).to be_truthy
  end

end

