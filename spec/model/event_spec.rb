require 'rails_helper'

RSpec.describe Event, :type => :model do
  before(:all) do
    @lead = build(:lead)
    @event = build(:event)
  end

  it "is valid with valid attributes" do
    expect(@event).to be_valid
  end

  it "has a name" do
    expect(@event.name).to eq("woke up")
  end

  it "has a valid update timestamp when updated" do
    @event.name = "hello"
    @event.save
    expect(@event.updated_at.strftime("%Y-%d-%m %H:%M:%S")).to eq(Time.now.strftime("%Y-%d-%m %H:%M:%S"))
  end
end