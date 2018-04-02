require 'rails_helper'


RSpec.describe Outreach, :type => :model do
  before(:all) do
    @outreach1 = create(:outreach)
  end

  it "is valid with valid attributes" do
    expect(@outreach1).to be_valid
  end
end