def admin_index_path_for as
  public_send "admin_#{as.to_s.pluralize}_path"
end

def admin_show_path_for as, resource
  public_send "admin_#{as}_path", resource
end

def admin_edit_path_for as, resource
  public_send "edit_admin_#{as}_path", resource
end

def admin_new_path_for as
  public_send "new_admin_#{as}_path"
end

RSpec.shared_examples 'An Admin Resource' do |resource_class, opts={}|
  resource_factory = opts[:resource_factory] || resource_class.model_name.element.to_sym
  as = opts[:as] || resource_class.model_name.element

  let!(:element) { create resource_factory }
  let!(:collection) { create_list resource_factory, 3 }

  it 'has an appropriate index page' do
    visit admin_index_path_for as
    # save_and_open_page
    expect(page).to have_selector "a[href*='#{admin_new_path_for(as)}']"
    resource_class.all.each do |r|
      expect(page).to have_selector "a[href*='#{admin_show_path_for(as, r)}']"
      expect(page).to have_selector "a[href*='#{admin_edit_path_for(as, r)}']"
    end
  end

  it 'has an appropriate show page' do
    visit admin_show_path_for(as, element)
    expect(page).to have_selector "a[href*='#{admin_index_path_for(as)}']"
    expect(page).to have_selector "a[href*='#{admin_edit_path_for(as, element)}']"
  end

  it 'has an appropriate edit flow' do
    visit admin_edit_path_for(as, element)
    expect(page).to have_selector "a[href*='#{admin_index_path_for(as)}']"

    page.click_button 'Update'
    expect(current_url).to match(/#{admin_show_path_for(as, element)}/)
  end

  it 'has an appropriate create flow' do
    visit admin_new_path_for(as)
    expect(page).to have_selector "a[href*='#{admin_index_path_for(as)}']"

    page.click_button 'Create'
  end
end
