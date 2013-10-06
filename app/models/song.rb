class Song < ActiveRecord::Base
  belongs_to :user
  before_save :ensure_hash

  validate :check_order_number

  def check_order_number
    if order_number < 1 || order_number > 25
      errors.add(:order_number, "should not be tampered with ... go back to start")
    end
  end

  def notify_email
    Notifier.notify_publish(self).deliver
  end

  private

  def ensure_hash
    unless url_hash
      self.url_hash = ::UUID.new.generate(:compact).slice(0,10)
    end
  end
end
