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
      song = Song.new
      song.save
      song
  end

  def self.new_by_name(name)
      song = Song.new
      song.name = name
      song
  end

  def self.create_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
  end

  def self.find_by_name(name)
      self.all.each {|song|
      if song.name == name
        return song
    end}
    return nil
  end

  def self.find_or_create_by_name(name)
      track = self.find_by_name(name)
      track == nil ? self.create_by_name(name) : track
  end

  def self.alphabetical
      self.all.sort_by{|song| song.name}
  end

end
