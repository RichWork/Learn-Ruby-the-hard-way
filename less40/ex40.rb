class Song  # Name of the class

# Runs automatically upon instantiation and assigns the input value to variable "lyrics"
  def initialize(lyrics)
    @lyrics = lyrics # Note that this creates an object variable @lyrics, which
    # which is different from the input variable lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line} # Note that it requires the @ to call the
    # class variable from the object
  end
end

# Creates a class object with the string added as the variable lyric
happy_bday = Song.new(["Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"])

  bulls_on_parade = Song.new(["They rally around tha family",
    "With pockets full of shells"])

# Calls the function sing_me_a_song from the class object.
# Note that happy_bday is a class object here, not a variable
    happy_bday.sing_me_a_song()

    bulls_on_parade.sing_me_a_song()
