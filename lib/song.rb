class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name = nil)
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name = nil)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name = nil)
   self.all.find {|song| song.name == name}  
  end
  
 def self.find_or_create_by_name(name)
  song1 = self.new
  song2 = self.new
  if song1.name == song2.name
  find_by_name
  else
  create_by_name
  end
  end
  
  def self.alphabetical
    self.all.sort_by {|a, b| a <=> b}
  end
  
  def self.new_from_filename(artist_and_song)
   if artist_and_song.end_with?(".mp3")
   song = self.new
   data = artist_and_song.split("-")
   song.artist_name = data[0]
   song.name = data[1].chomp".mp3"
   end
   song
  end

  def self.create_from_filename(filename)
  if filename.end_with?(".mp3")
  filename.chomp ".mp3"
  song = self.new
  @@all << song
  end
  end

  def self.destroy_all
  self.all.clear
  end
  
end

song = Song.create
Song.all.include?(song) #=> true

song = Song.new_by_name("The Middle")
#=> #<Song @name="The Middle">
song.name #=> "The Middle"

song = Song.create_by_name("The Middle")
#=> #<Song:0x007fd2a2989ff0 @name="The Middle">
song
#=> #<Song:0x007fd2a2989ff0 @name="The Middle">
Song.all.include?(song)
#=> true

the_middle = Song.create_by_name("The Middle")
#=> #<Song @name="The Middle">

Song.find_by_name("The Middle")
#<Song @name="The Middle">

# song_1 = Song.find_or_create_by_name("Blank Space")
# song_2 = Song.find_or_create_by_name("Blank Space")
# # song_1 and song_2 are conceptually the same song and should return the same song instance because of `.find_or_create_by_name.`
# song_1 == song_2 #=> true
Song.alphabetical
song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song.name #=> "Blank Space"
song.artist_name #=> "Taylor Swift"

song = Song.create_from_filename("Taylor Swift - Blank Space.mp3")
Song.destroy_all



