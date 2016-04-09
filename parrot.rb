class Parrot
  def initialize(name, gender, favourite_song)
    @name = name
    @gender = gender
    @favourite_song = favourite_song
  end

  def favourite_song
    puts "#{@name}'s favourite song is #{@favourite_song}."
  end
end
