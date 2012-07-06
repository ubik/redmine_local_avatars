require 'redmine'
require 'users_helper_avatar_patch'
require 'users_avatar_patch'
require 'application_helper_avatar_patch'
require 'my_account_hook'
require 'my_account_patch'
#require 'users_controller_patch'

Redmine::Plugin.register :redmine_local_avatars do
  name 'Redmine Local Avatars plugin'
  author 'A. Chaika'
  description 'This is a plugin for Redmine'
	version '0.0.3'
#	project_module :issue_tracking do
#		permission :view_avatars, {:issues => :get_avatar}, :public => true 
#	end
end
