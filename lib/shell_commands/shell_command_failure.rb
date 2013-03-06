class ShellCommandFailure < StandardError
	attr_accessor :result
	def initialize(result)
		@result = result
	end
end