require 'rails_helper'

RSpec.feature 'Test', type: :feature, authorized_admin: true do
  it_behaves_like 'An Admin Resource', Test
end
