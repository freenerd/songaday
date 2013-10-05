class Song < ActiveRecord::Base
  belongs_to :user

  validate :check_order_number

  def check_order_number
    if order_number < 1 || order_number > 25
      errors.add(:order_number, "should not be tampered with ... go back to start")
    end
  end

  def notify_email
    Notifier.notify_publish(self).deliver
  end
end
