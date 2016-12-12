require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase
  test "invalid without a word or definition" do
  	d = Definition.new
  	d.word = "test"
  	d.meaning = "test meaning"
  	assert !d.invalid?, "Word and/or definition is not being verified"
  end

  test "peremptory loads in fixtures" do
  	d = definitions(:peremptory)
  	assert d.valid?, "peremptory fixture is missing a word and/or meaning"
  end

  test "invalid definition gives error message" do
  	d = definitions(:turbid)
  	d.word = nil
  	d.valid?
  	assert_match /can't be blank/, d.errors[:word].join, "Presence error not found on definition"
  end

  # This test looks at whether a method in the model exists
  test "test method in model returns message" do
  	d = definitions(:turbid)
  	assert_equal "this is a test message", d.test_message
  end

  # Doesn't exist yet, but there should be a belongs_to/has_many relationship between definitions and users
  # The definitions fixture should have a user_id foreign key connecting to users - I haven't made users yet but this
  # might come in handy for when I do
  # For this to work, :turbid should have a user_id of 1
  test "definition belongs to a user" do
  	#d = definitions(:turbid)
  	#assert_equal d.user, 1
  	true # remove when actual test is ready to be used. Just here as a placeholder before users are created.

  	# For the user testing, which should NOT be in this file (should be in user_test.rb or whatever), try something like thie:
  	# Should set the user to the first user in the fixture, then check all the user's definition
  	# Then iterate over each definition (d) and check that each definition's user is equal to u
	  	# u = users(:one)
	  	# assert u.definitions.all? { |d| d.user == u }
  end
end
