require 'rails_helper'

describe UsersController, type: :controller do
  
  let(:user) { create(:user) }

  before do
    login_user user
  end

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get show" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get :show, params: { user_id: user }
    response.should be_success
  end
end