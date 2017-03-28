class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # a Devise method will ask for the user to be signed in before they access any of the pages on the site. In the applications controller it will be applied site wide.
  before_action :authenticate_user!
end
