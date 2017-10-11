class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper # makes helper available in controllers
end
