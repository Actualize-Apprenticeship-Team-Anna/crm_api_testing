require 'rails_helper'

RSpec.describe Lead, :type => :model do
  it "is valid from the baseline factory" do
    expect(build(:lead)).to be_valid
  end
end