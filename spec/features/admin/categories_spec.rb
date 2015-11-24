require 'rails_helper'

RSpec.feature 'Category', type: :feature, authorized_admin: true do
  it_behaves_like 'An Admin Resource', Category
end
