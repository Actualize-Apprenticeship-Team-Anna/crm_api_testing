require 'rails_helper'


RSpec.describe SettingsController, :type => :controller do
  before(:each) do
    @setting = create(:setting)
    @admin = create(:admin)
  end


  it "should have a setting" do
    sign_in @admin
    get :index
    expect(assigns(:settings)).to be_valid
  end



end