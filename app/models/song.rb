class Song < ActiveRecord::Base
  belongs_to :user

  def notify_email
    Notifier.notify_publish(self).deliver
  end
end
