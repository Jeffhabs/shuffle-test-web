require 'rails_helper'

RSpec.feature 'Admin Admin Users', type: :feature, authorized_admin: true do
  it_behaves_like 'An Admin Resource', AdminUser
end
