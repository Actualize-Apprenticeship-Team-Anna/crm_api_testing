require 'rails_helper'

RSpec.describe Setting, :type => :model do
  before(:all) do
    @setting1 = create(:setting)

  end

  it "is valid from the baseline factory" do
    expect(@setting1).to be_valid
  end
end