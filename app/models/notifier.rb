class Notifier < ActionMailer::Base
  default :from => 'any_from_address@example.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def notify_publish(song)
    if song.user && song.user.other_email
      mail(
        :to => song.user.other_email,
        :subject => "Look at todays song",
        :body => "Look at the current song"
      )
    end
  end
end
