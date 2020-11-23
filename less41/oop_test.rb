require 'open-uri' # Not sure what this does but possibly needed to run the URL

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = [] # Creaetes an empty array

# Creates a hash of phrases using the key as the question and the value as the answer
PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

# Creates a variable which takes the input argument "english" to trigger
# something different in the code, specifically flipping the questions and answer
PHRASE_FIRST = ARGV[0] == "english"

# Opens the URL (a text file) to file object f and goes through each line taking
# the word (word) and adding it to the words array, and removing the newline
open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)}
}

# Function which takes four inputs - this creates the substitute name in the questions
# rand_words is the random word list, snippet is the question key from PHRASES
# and pattern is the @@@, *** or ### from the questions
def craft_names(rand_words, snippet, pattern, caps=false)
  # variable names takes the snippet string (the question) and .scan looks for the "pattern" in the string
  # The .map changes the names variable to contain the snippet.scan(pattern) output
  names = snippet.scan(pattern).map do
    word = rand_words.pop() # This takes the last value out of the rand_word array
 # This is an if function, If caps is true, word gets capitalised, otherwise, its just the word
    caps ? word.capitalize : word
  end

  return names * 2 # returns the names twice, this is necessary to fill in the
  # answer as the words get popped below, i.e. the array shortens
end

# Function which takes three inputs
def craft_params(rand_words, snippet, pattern) # as above
  # Similar to above but seems to create a numeric array instead? From 0 to the length of the snippet
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) + 1
    params = (0...param_count).map {|x| rand_words.pop() } # maps params array with rand_words
    params.join(', ') # creates a single string from the rand_word pulled from above
  end

  return names * 2 # returns the array twice, which I think might be blank...
end

# Function with two inputs which possibly creates the random word array and questions
def convert(snippet, phrase)
  rand_words = WORDS.sort_by {rand} # takes the word array and sorts randomly
# creates the names from the word file, left uncapped, and can be found using the ### pattern in the questions
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
# creates other names from the word file, which are then capitalised, and can be
# found using the pattern \*\*\* in the questions
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
# creates the parameter names using the pattern code @@@ in the questions above
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = [] # creates an empty array/variable, wipes the old data too

# this section then creates the question layout depending upon the pattern identifier
# the result variable takes the names created and inserts them into the sentence at the identifier
  [snippet, phrase].each do |sentence|
    # fake class names, also copies sentence
# Note that gsub inserts the class name into the sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }

# adds the other names to the identifiers in the sentence, captured above
    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

# adds the other names to the identifiers in the sentence, captured above
    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop}

# adds the result to the array results
    results.push(result)
  end

  return results
end

# keep going until they hit CTRL-D
loop do
  # creates the snippets array using the keys from the PHRASES hash
  snippets = PHRASES.keys().sort_by {rand}

# creates the question by taking the snippets and assigning the random names
  for snippet in snippets
    phrase = PHRASES[snippet] # phrase is the answer part
# this line turns the snippets into the question and the phrase into the answer
    question, answer = convert(snippet, phrase) # snippet is the question, phrase is the answer

    if PHRASE_FIRST
      question, answer = answer, question # flips the question and answer
    end

    print question, "\n\n> " # spreads out the questions

    exit(0) unless $stdin.gets # exits the code on a ctrl D

    puts "\nANSWER: %s\n\n" % answer # prints answer, note notation
  end
end
