require 'rails_helper'


RSpec.describe SettingsController, :type => :controller do
  before(:each) do
    @admin = create(:admin)
    @setting = create(:setting, admin: @admin)

  end

  describe 'GET #index' do
    it "should have a setting" do
      sign_in @admin
      get :index
      expect(assigns(:settings)).to be_valid
    end
  end

  describe 'PATCH #update' do 
    context 'when the setting saves successfully' do 
      it 'should update auto_text_content' do
        sign_in @admin
        patch :update, params: {
          settings: {auto_text_content: 'new string'}
        }
        settings = assigns(:settings)
        expect(settings[:auto_text_content]).to eq('new string')
      end
    end
    context 'when the setting does not save' do 
      it 'should redirect to settings/edit' do
        sign_in @admin
        allow_any_instance_of(Setting).to(
          receive(:save)
        ).and_return false
         patch :update, params: {
          settings: {auto_text_content: 'new string'}
        }
        expect(response).to redirect_to("/settings/edit") 
      end
    end

    
  end



end