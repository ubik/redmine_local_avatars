require 'application'
#require 'user' 

module LocalAvatarsPlugin
  module UsersAvatarPatch
    def self.included(base) # :nodoc:    
      base.class_eval do      
        unloadable
  			has_many :attachments, {:as => :container,
  															:order => "#{Attachment.table_name}.created_on",
  															:dependent => :destroy}
      end
    end
  end
end
User.send(:include, LocalAvatarsPlugin::UsersAvatarPatch)