class Song < ActiveRecord::Base
  belongs_to :user

  def validate
    if self.order_number < 1 || self.order_number > 25
      errors.add(:order_number, "should not be tampered with ... go back to start")
    end
  end

  def notify_email
    Notifier.notify_publish(self).deliver
  end
end
