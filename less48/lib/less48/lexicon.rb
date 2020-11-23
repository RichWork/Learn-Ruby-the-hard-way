module Lexicon
# stuff = $stdin.gets.chomp
# words = stuff.split

@directions = ["north", "south", "east", "west", "down", "up", "left", "right", "back"]
@verbs = ["go", "stop", "kill", "eat"]
@stops = ["the", "in", "of", "from", "at", "it"]
@nouns = ["door", "bear", "princess", "cabinet"]


# Note that the code below pushes an array into the results array, creating a nested array
def Lexicon.scan(input)
  @results = []
  # Added the downcase to remove all caps from the input to avoid issues
  @input_split = input.downcase.split
  @input_split.each do |word|
    if @directions.include?(word)
      @results << ['direction', word] # Note that << is the same as push.
    elsif @verbs.include?(word)
      @results << ['verb', word]
    elsif @stops.include?(word)
      @results << ['stop', word]
    elsif @nouns.include?(word)
      @results << ['noun', word]
    else
      begin
        Integer(word)
        @results << ['number', word.to_i]
      rescue
        @results << ['error', word]
      end
    end
  end
  return @results
end

end

#Tom's alternative from line 23 goes:
# elsif word.match(/^\d+$/)
#         results << ['number', word.to_i]
#       else
#         results << ['error', word]
#       end
# Line 39 matches numerics using the \d+ but I'm not sure about the other
# operators (^, $)
# The error code is also stuck on a different part of the if function, whereas
# mine results from the rescue as there are no further things to test at that point
