module ControllerMacros
  # def login_user
  #   before(:each) do
  #     controller.stub(:authenticate_user!).and_return true
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     sign_in FactoryBot.create(:user)
  #   end
  # end
  
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user_tanaka]
      user = FactoryBot.create(:user_tanaka)
      user.save # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
    end
  end
end