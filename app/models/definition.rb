class Definition < ApplicationRecord
	#refactor onto one line
	validates :word, presence: true
	validates :meaning, presence: :true

	# This method is only used in the tests, it has no bearing on the application and only serves as information for myself
	def test_message
		"this is a test message"
	end
end
