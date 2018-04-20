require 'rails_helper'
RSpec.describe Outreach, :type => :model do
  it "is valid with valid attributes" do
    expect(build(:outreach)).to be_valid
  end
end