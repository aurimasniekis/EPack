require "thor"
module EPack
	class CLI < Thor
		include Thor::Actions

		def initialize(*)
			super
			the_shell = (options["no-color"] ? Thor::Shell::Basic.new : shell)
      EPack.ui = UI::Shell.new(the_shell)
      EPack.ui.debug! if options["verbose"]
		end

		check_unknown_options!

		default_task :init

		class_option "no-color", :type => :boolean, :banner => "Disable colorization in output"
    class_option "verbose",  :type => :boolean, :banner => "Enable verbose output mode", :aliases => "-V"

    desc "init", "Generates a EFile into the current working directory"
    long_desc <<-D
    	Init Generates a default EFile in the current working directory.
    D
    def init
    	opts = options.dup
    	if File.exists?("EFile")
    		EPack.ui.error "EFile already exists at #{Dir.pwd}/EFile"
    		exit 1
    	else
    		puts "Writing new EFile to #{Dir.pwd}/EFile"
    		FileUtils.cp(File.expand_path('../templates/EFile', __FILE__), 'EFile')
    	end
    end

	end
end