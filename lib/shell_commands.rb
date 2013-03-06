require 'shell_commands/shell_command_failure'
require 'shell_commands/shell_command'

def do_command(command)
	ShellCommand.do_command(command)
end

def result_matches(regex)
	return !regex.match(ShellCommand.last_result).nil? if regex.class = "Regex"
	return !Regex.new(regex).match(ShellCommand.last_result).nil?
end

def regex_result(regex)
  return regex.match(ShellCommand.last_result) if regex.class = "Regex"
  return Regex.new(regex).match(ShellCommand.last_result)
end