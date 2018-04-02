require 'rails_helper'

RSpec.describe Admin, :type => :model do
  before(:all) do
    @admin1 = create(:admin)

  end

  it "is valid with valid attributes" do
    expect(@admin1).to be_valid
  end

  it "is not valid with invalid attributes" do
    expect(@admin1).to be_invalid
  end
end