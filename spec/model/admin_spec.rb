require 'rails_helper'

RSpec.describe Admin, :type => :model do
  before(:all) do
    @admin1 = build(:admin)
    @lead1 = build(:lead)
  end

  it "is valid with valid attributes" do
    expect(@admin1).to be_valid
  end

  it "is invalid with invalid attributes" do
    expect{ build(:admin, email: "5")}.to raise_error (ActiveRecord::RecordInvalid)
  end

  it "is invalid with invalid without @ in email" do
    expect{ build(:admin, email: "email.com")}.to raise_error (ActiveRecord::RecordInvalid)
  end

  it "creates a record for the admin if there is no daily progress log" do
    @admin1.record_progress(@lead1)
    @dpl = DailyProgressLog.find_by(admin_id: @admin1.id, date: Date.today)
    expect(@dpl.admin_id).to eq(@admin1.id)
  end

  

end