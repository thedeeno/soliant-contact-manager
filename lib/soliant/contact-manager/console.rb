require 'highline'
require 'cli-console'

module Soliant
module ContactManager

class Console
  def self.start(list)
    io = HighLine.new
    cmds = Commands.new(list)
    console = CLI::Console.new(io)

    console.addCommand('find', cmds.method(:find), 'Print contact with email')
    console.addCommand('query', cmds.method(:query), 'Print contacts who\'s last name start with letter')

    console.addHelpCommand('help', 'Help')
    console.addExitCommand('exit', 'Exit from program')
    console.start("contact-manager > ",[Dir.method(:pwd)])
  end

  class Commands
    private

    extend CLI::Task


    public

    def initialize(list)
      @list = list
    end

    usage 'Usage: find [email]'
    desc 'Prints contact with given email'
    def find(params)
      puts @list.find(*params)
    end

    usage 'Usage: query [field] [letter]'
    desc 'Prints contacts who\'s given field starts with given letter'
    def query(params)
      @list.query(*params).each { |contact| puts contact }
    end
  end
end

end
end
