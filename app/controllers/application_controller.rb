class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# Change user and password accoding to your environment
	USERS = { 'user' => 'password' }

	before_action :digest_auth

	def digest_auth
		authenticate_or_request_with_http_digest do |user|
			USERS[user]
		end
	end
end
