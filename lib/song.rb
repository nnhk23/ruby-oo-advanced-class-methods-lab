require 'pry'

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(song)
    @@all.find{|x| x.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.find_by_name(song) == nil
        self.create_by_name(song) 
    else 
        self.find_by_name(song)
    end
  end

  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(/ /, 3)[2].split(".")[0]
    song.artist_name = filename.split(/ /, 3)[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    song.name = filename.split(/ /, 3)[2].split(".")[0]
    song.artist_name = filename.split(/ /, 3)[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
