class ShellCommandFailure < StandardError
	attr_accessor :result, :command
	def initialize(result, command)
		@result = result
		@command = command
	end
end