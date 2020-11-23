module Ex25

  # This function will break up words for us.
  # The .split(' ') is splitting the sentence on the ' ', e.g. spaces
  # Note that it outputs multiple values which requires a variable to capture
  def Ex25.break_words(stuff)
    words = stuff.split(' ')
    return words
  end

  # Sorts the words.
  # Sort arranges the words in ascending alphabetical order (A->Z)
  # Note it outputs a value which requires a variable
  def Ex25.sort_words(words)
    return words.sort
  end

  # Prints the first word after popping it off.
  # The .shift removes the first word or more accurately, first value in an
  # list. This function does not work on a single variable.
  # Note that this .shift also changes the original variable, actually removing
  # the first variable in the list, and putting it in the "word" variable.
  def Ex25.print_first_word(words)
    word = words.shift
    puts word
  end

  # Prints the last word after popping it off.
  # The .pop removes the last value in an list. This function does not work on
  # a single variable.
  # Note that this .pop also changes the original variable, actually removing
  # the last variable in the list, and putting it in the "word" variable.
  def Ex25.print_last_word(words)
    word = words.pop
    puts word
  end

  # Takes in a full sentence and returns the sorted words.
  # This code breaks the sentence by spaces and arranges the words in
  # alphabetical order, essentially running the two functions above
  def Ex25.sort_sentence(sentence)
    words = Ex25.break_words(sentence)
    return Ex25.sort_words(words)
  end

  # Prints the first and last words of the sentence.
  # As mentioned above, .shift and .pop will not work on a single variable.
  # This function breaks the sentence into an list and then does the shift and pop
  def Ex25.print_first_and_last(sentence)
    words = Ex25.break_words(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end

  # Sorts the words then prints the first and last one.
  # Again, like above, runs multiple nested functions to generate the output
  def Ex25.print_first_and_last_sorted(sentence)
    words = Ex25.sort_sentence(sentence)
    Ex25.print_first_word(words)
    Ex25.print_last_word(words)
  end

end
