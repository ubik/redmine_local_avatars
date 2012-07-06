require 'application_helper'

module LocalAvatarsPlugin
  module ApplicationAvatarPatch
    def self.included(base) # :nodoc:    
      base.send(:include, InstanceMethods)     
      base.class_eval do
  			alias_method_chain :avatar, :local
      end
    end
    module InstanceMethods    
      def avatar_with_local(user, options = { })
        if user.is_a?(User) then
          av = user.attachments.find_by_description 'avatar'
          if av then
            image_url = url_for :only_path => true, :controller => 'account', :action => 'get_avatar', :id => user
            options[:size] = "64" unless options[:size]
            return "<img class=\"gravatar\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{image_url}\" />"
          end
        end
        avatar_without_local(user, options)
      end
    end
  end
end

ApplicationHelper.send(:include, LocalAvatarsPlugin::ApplicationAvatarPatch)
