ActiveAdmin.setup do |config|
  # == Site Title
  config.site_title = 'ShuffleTest'

  # == Root Page
  config.root_to = 'questions#index'

  # == User Authentication
  config.authentication_method = :authenticate_admin_user!

  # == Current User
  config.current_user_method = :current_admin_user

  # == Logging Out
  config.logout_link_path = :destroy_admin_user_session_path

  # == Batch Actions
  config.batch_actions = true

  # == Controller Filters
  config.localize_format = :long

  # == Print Stylesheet
  config.register_stylesheet 'print.css', media: :print
end
