def events_create(*args)
  event = ActiveSupport::Notifications::Event.new(*args)
  Event.create(:name => event.name, :user => event.payload[:user], :body => event.payload[:body])
end


class ActiveRecord::Base
  def save(*)
    result = super
    if result
      case self.class.to_s
        when "User"
          ActiveSupport::Notifications.instrument("user-sign_in", :user => self.email, :body => self.attributes)
        when "Comment"
          ActiveSupport::Notifications.instrument("comment-added", :user => self.user.email, :body => self.attributes)
        when "Like"
          ActiveSupport::Notifications.instrument("like-added",  :user => self.user.email, :body => self.attributes)
        else
          nil
      end
    end
    result
  end
end


ActiveSupport::Notifications.subscribe("user-sign_in") { |*args| events_create(*args)}
ActiveSupport::Notifications.subscribe("comment-added") { |*args| events_create(*args)}
ActiveSupport::Notifications.subscribe("like-added") { |*args| events_create(*args)}
