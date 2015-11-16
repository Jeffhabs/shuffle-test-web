require 'rails_helper'

RSpec.feature 'Questions', type: :feature, authorized_admin: true do
  it_behaves_like 'An Admin Resource', Question
end
