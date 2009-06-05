require 'redmine'
require_dependency 'account_controller' 

class AccountController < ApplicationController
  helper :attachments
  include AttachmentsHelper 
  def get_avatar
    @user = User.active.find(params[:id])
		#@user = User.find(params[:id])
    av = @user.attachments.find_by_description 'avatar'
    send_file(av.diskfile, :filename => filename_for_content_disposition(av.filename),
                                    :type => av.content_type, 
                                    :disposition => (av.image? ? 'inline' : 'attachment')) if av 
  end
end
