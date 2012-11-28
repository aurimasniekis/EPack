require 'fileutils'
require 'pathname'
require 'EPack/version'
require 'pathname'

module EPack
  # Your code goes here...

  autoload :UI,	'epack/ui'

  class EPackError < StandardError
    def self.status_code(code)
      define_method(:status_code) { code }
    end
  end

  class << self
  	attr_accessor :ui


  	def ui
  		@ui ||= UI.new
  	end

  end
end