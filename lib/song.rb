class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.create  # or instantiate and trigger .create method
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end
  
  def self.find_by_name(song_name = nil)
   self.all.find {|song| song.name == song_name}  
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
    # if self.find_by_name(song_name)
    # self.find_by_name(song_name)
    # else
    # self.create_by_name(song_name)
    # end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(artist_and_song)
   data = artist_and_song.split(" - ")
   artist = data[0]
   song_name = data[1].gsub(".mp3","") # - substitue first value with second, or data[1].split(".")[0] # data[1].gsub(".mp3",""), or chomp
   song = self.new_by_name(song_name)
   song.artist_name = artist
   song
  end

  def self.create_from_filename(song)
    self.new_from_filename(song)
  end

  def self.destroy_all
  self.all.clear
  end
end