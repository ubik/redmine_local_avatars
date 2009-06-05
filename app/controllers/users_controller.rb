require 'redmine'
require_dependency 'users_controller' 

class UsersController < ApplicationController
  helper :attachments
  include AttachmentsHelper 
  def save_avatar
		@user = User.find(params[:id])
    file_field = params[:avatar] rescue nil
		@user.attachments.clear
		attachments = attach_files(@user, {'first' => {'file' => file_field, 'description' => 'avatar'}}) 
		flash[:notice] = l :message_avatar_uploaded
		@user.save
		redirect_to :action => 'edit', :id => @user
  end
  def get_avatar
		@user = User.find(params[:id])
    av = @user.attachments.find_by_description 'avatar'
    send_file(av.diskfile, :filename => filename_for_content_disposition(av.filename),
                                    :type => av.content_type, 
                                    :disposition => (av.image? ? 'inline' : 'attachment')) if av 
  end
end
