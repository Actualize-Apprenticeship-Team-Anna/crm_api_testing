require 'rails_helper'

RSpec.describe Setting, :type => :model do 
  it "is valid with valid attributes" do 
    expect(build(:setting)).to be_valid
  end
end