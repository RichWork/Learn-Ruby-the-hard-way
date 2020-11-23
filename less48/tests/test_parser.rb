require "./less48/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase
  def test_peek()
    # test_sentence = Sentence.new([['verb', 'run'], ['direction', 'north']])
    assert_equal(peek([['direction', 'north']]), 'direction')
    result = peek([['direction', 'north'],['noun', 'bear']])
    assert_equal(result, 'direction')
    # assert_equal(peek(), nil) # can't seem to test the else of peek()
  end

     # result = Lexicon.scan("north south east")
     #
     # assert_equal(result, [['direction', 'north'],
     #        ['direction', 'south'],
     #        ['direction', 'east']])
  def test_match()
    assert_equal(match([['direction', 'north']],'direction'), ['direction', 'north'])
    assert_equal(match([['direction', 'north']],'verb'), nil)

    test = ([['direction', 'north'], ['verb', 'go'], ['noun', 'bear']])
    assert_equal(match(test, 'direction'), ['direction', 'north'])
    assert_equal(test.length, 2) # checks that match is removing elements from the array
    assert_equal(match(test, 'verb'), ['verb', 'go'])
    assert_equal(test.length, 1)
    assert_equal(match(test, 'noun'), ['noun', 'bear'])

    test = ([['direction', 'north'], ['verb', 'go'], ['noun', 'bear']])
    assert_equal(match(test, 'verb'), nil)
    assert_equal(test.length, 2) # checks that match is removing elements from the array
    assert_equal(match(test, 'noun'), nil)
    assert_equal(test.length, 1)
    assert_equal(match(test, 'direction'), nil)
    # assert_equal(match([],'verb'), nil) # not sure how to test this
  end

  def test_skip
    test = ([['direction', 'north'], ['verb', 'go'], ['noun', 'bear']])
    result = skip(test,'noun')
    assert_equal(result, nil)
    assert_equal(test.length, 3) # since match didn't run, no elements removed

    result2 = skip(test,'direction') # note that, even though this would run match inside skip
    # the output is still nil as skip doesn't return anything as the match is within a while loop
    assert_equal(result2, nil)
    assert_equal(test.length, 2) # since match did run, an element should be removed
  end

  def test_parse_verb
    assert_equal(parse_verb([['verb','go']]), ['verb','go'])

    test = ([['stop', 'the'], ['verb', 'go'], ['noun', 'bear']])
    result = parse_verb(test)
    assert_equal(result, ['verb','go'])
    assert_equal(test.length, 1) # since match ran twice (skip and parse), 2 elements removed

# Checks if parse_verb fails on receiving a noun instead
    exception = assert_raise(ParserError) do parse_verb([['noun','bear']]) end
    assert_equal("Expected a verb next.", exception.message)

  end

  def test_parse_object
    assert_equal(parse_object([['noun','bear']]), ['noun','bear'])
    assert_equal(parse_object([['direction','south']]), ['direction','south'])

    test = ([['stop', 'the'], ['noun', 'bear'], ['verb', 'go']])
    result = parse_object(test)
    assert_equal(result, ['noun','bear'])
    assert_equal(test.length, 1) # since match ran twice (skip and parse), 2 elements removed

# Checks if parse_object fails on receiving a noun instead
    exception = assert_raise(ParserError) do parse_object([['verb','go']]) end
    assert_equal("Expected a noun or direction next.", exception.message)

  end

  def test_parse_subject
    assert_equal(parse_subject([['noun','bear']]), ['noun','bear'])
    assert_equal(parse_subject([['verb','go']]), ['noun','player'])

    test = ([['stop', 'the'], ['noun', 'bear'], ['verb', 'go']])
    result = parse_subject(test)
    assert_equal(result, ['noun','bear'])
    assert_equal(test.length, 1) # since match ran twice (skip and parse), 2 elements removed

    test = ([['stop', 'the'], ['verb', 'go'], ['noun', 'bear']])
    result = parse_subject(test)
    assert_equal(result, ['noun','player'])
    assert_equal(test.length, 2) # since match ran once (skip only), 1 elements removed

# Checks if parse_subject fails on receiving a noun instead
    exception = assert_raise(ParserError) do parse_subject([['test','test']]) end
    assert_equal("Expected a verb next.", exception.message)

  end

  def test_parse_sentence
    test = ([['stop', 'the'], ['verb', 'go'], ['noun', 'bear']])
    result = parse_sentence(test)
    assert_equal(test.length, 0) # since match ran three times, 3 elements removed
    assert_equal(result.subject, 'player')
    assert_equal(result.verb, 'go')
    assert_equal(result.object, 'bear')

# Following taken from Tom's code for testing a bad sentence
    assert_raises(ParserError) do
      parse_sentence([['subject', 'man'], ['direction', 'disco'], ['verb', 'dance']])
    end
  end
end
