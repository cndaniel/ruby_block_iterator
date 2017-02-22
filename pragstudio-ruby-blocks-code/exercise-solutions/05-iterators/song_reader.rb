require 'csv'

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

class SongReader
  def initialize(csv_file_name)
    @csv_file_name = csv_file_name
  end

  def each
    CSV.foreach(@csv_file_name, headers: true) do |row|
      song = Song.new(row["name"], row["artist"], row["duration"].to_i)
      yield song
    end
  end

end

reader = SongReader.new("songs.csv")

reader.each do |song|
  p song
end
