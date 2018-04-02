require 'rails_helper'

RSpec.describe Event, :type => :model do
  before(:all) do
    @event1 = create(:event1)

  end

  it "is valid from the baseline factory" do
    expect(@event1).to be_valid
  end
end