class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def self.create
    @@all << self.new
  end
 
  def self.new_by_name(name)
    @name = name
    @@all << self
  end 
 
  def self.find_or_create_by_name(name)
    @@all.find{|song| song.name == name} 
      if nil
        self.create_by_name(name)
        self.all.find{|song| song.name == name}
      end
  end
   
  def self.alphabetical
    @@all.sort_by!{ |song| song.group.name.downcase }
  end
  
  def self.new_from_filename(filename)
    delimiters = ['-']
    filename.tr!('.mp3')
    data = filename.split(Regexp.union(delimiters))
    artist_name = data[0]
    name = data[1]
    song = self.new # This is an important line.
    song.artist_name = artist_name
    song.name = name
    song
  end
  
  def self.create_from_filename
    
  end
  
  def self.destroy_all
    self.all.clear
  end
   
  def save
    self.class.all << self
  end
end