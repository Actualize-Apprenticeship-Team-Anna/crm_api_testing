require 'rails_helper'

RSpec.describe Lead, :type => :model do
  before(:all) do
    @lead1 = create(:lead)
  end

  it "is valid from the baseline factory" do
    expect(@lead1).to be_valid
  end
end