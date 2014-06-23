module SessionsTemplatesHelper
	 def authorize_user
	 		redirect_to sign_in_form_path unless user_signed_in?
	 end
end
