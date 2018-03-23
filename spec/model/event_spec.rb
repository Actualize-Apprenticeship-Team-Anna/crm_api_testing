require 'rails_helper'

RSpec.describe Event, :type => :model do 
  before(:all) do 
    @event1 = create(:event)
  end

  it "is valid with valid attributes" do
    expect(@event1).to be_valid
  end
end