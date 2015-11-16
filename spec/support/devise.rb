RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :feature
  config.before :each, type: :feature do
    Warden.test_mode!
  end
  config.after :each, type: :feature do
    Warden.test_reset!
  end
end

RSpec.shared_context :authorized_admin, authorized_admin: true do
  let(:authorized_admin_user) { create :admin_user }

  before(:each) do |example|
    if example.metadata[:type] == :controller
      sign_in authorized_admin_user
    elsif example.metadata[:type] == :request
      post admin_user_session_path, 'admin_user[email]' => authorized_admin_user.email, 'admin_user[password]' => authorized_admin_user.password
    else
      login_as(authorized_admin_user, scope: :admin_user)
    end
  end

  after(:each) do |example|
    sign_out authorized_admin_user if example.metadata[:type] == :controller
  end
end
