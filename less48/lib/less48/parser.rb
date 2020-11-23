class ParserError < Exception
end

class Sentence

  def initialize(subject, verb, obj)
    # remember we take ['noun,'princess'] pairs and convert them
    @subject = subject[1]
    @verb = verb[1]
    @object = obj[1]
  end

  attr_reader :subject
  attr_reader :verb
  attr_reader :object
end

# looks at the next word in the word_list and returns it, Note that it returns
# the word type not the actual word
def peek(word_list)
  if word_list # if word_list exists
    word = word_list[0] # position 0 is the next word
    return word[0] # returns the next word in the word_list
  else
    return nil # else returns nothing
  end
end

# Matches the first word from word_list to the word_type
def match(word_list, expecting)
  if word_list
    word = word_list.shift # takes the first word from the word_list, note that
    # the word_list is permanently changed. Note the first word will be the word type

    if word[0] == expecting # if the word matches what is expected
      return word # return the word
    else
      return nil
    end
  else
    return nil
  end
end

# Skips words not needed by the sentence, e.g. error or stop words
def skip(word_list, word_type)
  while peek(word_list) == word_type
    match(word_list, word_type)
  end
end

def parse_verb(word_list)
  skip(word_list, 'stop') # skips unimportant stop words

  if peek(word_list) == 'verb' # peek ahead to see if the next word is a verb
    return match(word_list, 'verb')
  else
    raise ParserError.new("Expected a verb next.") # Raise error if not a verb
  end
end

def parse_object(word_list)
  skip(word_list, 'stop') # skips unimportant stop words
  next_word = peek(word_list) # peek is set as a variable since it is used twice here

  if next_word == 'noun' # peek ahead to see if the next word is a verb
    return match(word_list, 'noun')
  elsif next_word == 'direction'
    return match(word_list, 'direction')
  else
    raise ParserError.new("Expected a noun or direction next.") # Raise error if not a verb
  end
end

def parse_subject(word_list)
  skip(word_list, 'stop') # skips unimportant stop words
  next_word = peek(word_list) # peek is set as a variable since it is used twice here

  if next_word == 'noun' # peek ahead to see if the next word is a verb
    return match(word_list, 'noun')
  elsif next_word == 'verb'
    return ['noun', 'player']
  else
    raise ParserError.new("Expected a verb next.") # Raise error if not a verb
  end
end

def parse_sentence(word_list)
  # puts word_list
  # puts "\n"
  subj = parse_subject(word_list)
  # puts word_list
  # puts "\n"
  verb = parse_verb(word_list)
  # puts word_list
  # puts "\n"
  obj = parse_object(word_list)
  # puts word_list
  # puts "\n"

  return Sentence.new(subj, verb, obj)
end

# Method of operation:
# parse_sentence runs on sentence input in pattern [[wordtype, word],...]
# parse_subject runs on sentence input
# runs skip on 'stop' words
# runs a while loop with peek on the 'stop' words,
# if the word is a 'stop', runs match without a call. match then removes that word
# from the word_list and since there is no call, it is gone from the array
# if the word is not a 'stop', skip ends with no return
# peek is then run to see what the next_word type will be
# if noun, then returns match, which removes the word from the word_list and returns
# it to the subj variable
# if a verb, then puts ['noun', 'player'] as the return to subj variable
# Note that the word_list is shortened by subj, verb and obj.
# In addition, this parser can only handle a sentence with 1 subject, verb and object
# It cannot handle just a single word or multiples of the same word type
