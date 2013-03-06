
class ShellCommand
	@@results = []
	@@last_result = nil
	@@error_proc = nil

	def self.last_result
		@@last_result
	end
	def self.error_proc
		@@error_proc
	end
	def self.results
		@@results
	end

	def self.raw_do_command(command)
		@@last_result = %x[#{command} 2>&1]
		while not $?.exited? do
		end
		@@results << {
			:command => command, 
			:result => @@last_result, 
			:success => $?.success?
		}
		return $?.success?
	end

	def self.do_command(command)
		if !raw_do_command(command)
			if @@error_proc.nil?
				raise ShellCommandFailure.new(@@last_result, command)
			else
				@@error_proc.call(@@last_result, command)
			end
			return false
		end
		return true
	end

end

