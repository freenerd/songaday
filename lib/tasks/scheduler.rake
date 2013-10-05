namespace :scheduler do
  desc "search and handle for unnotified songs"
  task :handle_unnotified_songs => :environment do
    # find unnotified songs
    songs = Song.
      where("? > ?", :publish_at, Time.now).
      where("notified_email_at IS NULL AND notified_phone_at IS NULL")

    songs.each do |song|
      song.notify_email
    end
  end
end
