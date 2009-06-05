require_dependency 'users_helper' 

module LocalAvatarsPlugin
  module UsersHelperPatch
    def self.included(base) # :nodoc:    
      base.send(:include, InstanceMethods)     
      base.class_eval do      
        unloadable
        alias_method_chain :user_settings_tabs, :avatar
      end
    end
    module InstanceMethods    
      def user_settings_tabs_with_avatar
        tabs = user_settings_tabs_without_avatar
        tabs << {:name => 'avatar', :partial => 'users/avatar', :label => :label_avatar}
      end
    end
  end
end

UsersHelper.send(:include, LocalAvatarsPlugin::UsersHelperPatch)