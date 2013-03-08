require 'shell_commands/shell_command_failure'
require 'shell_commands/shell_command'

def do_command(command)
	ShellCommand.do_command(command)
end

def get_result_of(command)
  do_command command
  ShellCommand.last_result[:result]
end

def result_matches(regex)
	return !regex.match(ShellCommand.last_result[:result]).nil? if regex.class == "Regexp"
	return !Regexp.new(regex).match(ShellCommand.last_result[:result]).nil?
end

def regex_result(regex)
  return regex.match(ShellCommand.last_result[:result]) if regex.class == "Regexp"
  return Regexp.new(regex).match(ShellCommand.last_result[:result])
end