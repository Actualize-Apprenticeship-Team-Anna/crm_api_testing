require 'rails_helper'

RSpec.describe Admin, :type => :model do
  before(:each) do
    @admin = create(:admin)
    @lead = create(:lead)
  end

# Email validity
  it "is valid with valid attributes" do
    expect(@admin).to be_valid
  end

  it "is invalid with invalid attributes" do
    expect{ create(:admin, email: "5")}.to raise_error (ActiveRecord::RecordInvalid)
  end

  it "is invalid with invalid without @ in email" do
    expect{ create(:admin, email: "email.com")}.to raise_error (ActiveRecord::RecordInvalid)
  end

# Record Progress method
  it "creates a new record for the admin if there is no daily progress log" do
    @admin.record_progress(@lead)
    dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today)
    expect(dpl.admin).to eq(@admin)
  end

  it "adds to a new record for the admin if there is a recent daily progress log" do
    @admin.record_progress(@lead)
    @admin.record_progress(@lead)
    dpl_count = DailyProgressLog.where(admin: @admin).count
    expect(dpl_count).to eq(1)
  end

  it "creates a new record for the admin if there is an old daily progress log" do
    DailyProgressLog.create(admin: @admin, date: 7.days.ago, processed: 0, connects: 0, sets: 0)
    @admin.record_progress(@lead)
    dpl_count = DailyProgressLog.where(admin: @admin).count

    expect(dpl_count).to eq(2)
  end

  it "increments processed in all cases if there's already a record" do
    @admin.record_progress(@lead)
    old_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).processed
    @admin.record_progress(@lead)
    new_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).processed
    expect(new_dpl).to eq(old_dpl + 1)
  end
  
  it "increments connects if lead is connected" do
    @lead.connected = true
    @admin.record_progress(@lead)
    old_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).connects
    @admin.record_progress(@lead)
    new_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).connects
    expect(new_dpl).to eq(old_dpl + 1)
  end

  it "does not increment connects if lead isn't connected" do
    @admin.record_progress(@lead)
    old_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).connects
    @admin.record_progress(@lead)
    new_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).connects
    expect(new_dpl).to eq(old_dpl)
  end

  it "increments sets if lead is appointment_date" do
    @lead.appointment_date = Date.today
    @admin.record_progress(@lead)
    old_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).sets
    @admin.record_progress(@lead)
    new_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).sets
    expect(new_dpl).to eq(old_dpl + 1)
  end

  it "does not increment sets if lead isn't appointment_date" do
    @admin.record_progress(@lead)
    old_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).sets
    @admin.record_progress(@lead)
    new_dpl = DailyProgressLog.find_by(admin: @admin, date: Date.today).sets
    expect(new_dpl).to eq(old_dpl)
  end

end