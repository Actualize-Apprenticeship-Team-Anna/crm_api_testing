require 'rails_helper'

RSpec.describe Admin, :type => :model do
  before(:each) do
    @admin = create(:admin)
    @lead = create(:lead)
  end

  it "is valid with valid attributes" do
    expect(@admin).to be_valid
  end

  it "is invalid with invalid attributes" do
    expect{ create(:admin, email: "5")}.to raise_error (ActiveRecord::RecordInvalid)
  end

  it "is invalid with invalid without @ in email" do
    expect{ create(:admin, email: "email.com")}.to raise_error (ActiveRecord::RecordInvalid)
  end

  it "creates a record for the admin if there is no daily progress log" do
    @admin.record_progress(@lead)
    dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today)
    expect(dpl.admin).to eq(@admin)
  end

  

end