require 'rails_helper'

RSpec.describe Setting, :type => :model do 
  before(:each) do
    @setting = create(:setting)
  end

  it "is valid with valid attributes" do 
    expect(@setting).to be_valid
  end

  it "remembers auto text content" do
    expect(@setting.auto_text_content).to eq("I believe in a thing called love")
  end
end