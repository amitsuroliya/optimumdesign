RailsAdmin.config do |config|

	### Popular gems integration

	## == Devise ==
	#  config.authenticate_with do
	#    warden.authenticate! scope: :admin
	#  end
	#  config.current_user_method(&:current_admin)

	config.authorize_with do
		authenticate_or_request_with_http_basic('Login required') do |username, password|
			username == Rails.application.secrets.user &&
				password == Rails.application.secrets.password
		end
	end
	## == Cancan ==
	# config.authorize_with :cancan

	## == Pundit ==
	# config.authorize_with :pundit

	## == PaperTrail ==
	# config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

	### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

	config.actions do
		dashboard                     # mandatory
		index                         # mandatory
		new
		export
		bulk_delete
		show
		edit
		delete
		show_in_app

		## With an audit adapter, you can add:
		# history_index
		# history_show
	end
end
