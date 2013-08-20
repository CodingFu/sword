# coding: utf-8
module Sword
  module Execute
    module Options
      def parse_build
        @parser.on '-b', '--build', 'Build project into .zip' do
          @options[:build] = true
        end
      end

      def parse_compress
        @parser.on '-c', '--compress', 'Compress assets' do 
          @options[:compress] = true
        end
      end

      def parse_debug
        @parser.on '-D', '--debug', 'Show server’s guts' do
          @options[:debug] = true
        end
      end

      def parse_dir
        @parser.on '-d', '--dir <name>', 'Specify watch directory' do |name|
          @options[:directory] = name
        end
      end

      def parse_error
        @parser.on '-e', '--error <page>', 'Specify error page' do |page|
          @options[:error] = page
        end
      end

      def parse_favicon
        @parser.on '-f', '--favicon <i>', 'Specify favicon' do |icon|
          @options[:favicon] = icon
        end
      end

      def parse_gem
        @parser.on '--gem <name>', 'Add a gem to require' do |name|
          Loader.add_to_load(name)
          exit
        end
      end

      def parse_generate
        @parser.on '-g', '--generate', 'Generate boilerplate' do
          @options[:generate] = true
        end
      end

      def parse_help
        @parser.on '-h', '--help', 'Print this message' do
          puts parser
          exit
        end
      end

      def parse_install
        @parser.on '-i', '--install', 'Try to install must-have gems' do
          Loader.install_gems
          exit
        end
      end

      def parse_load
        @parser.on '-l', '--load <file>', 'Load gems from specified file' do |file|
          @options[:load_file] = file
        end
      end

      def parse_manual
        @parser.on '-m', '--manual <x,y>', 'Specify gems to require' do |gems|
          gems.each { |g| require g }
          @options[:unload] = true
        end
      end

      def parse_port
        @parser.on '-p', '--port <num>', 'Change the port, 1111 by default' do |num|
          @options[:port] = num
        end
      end

      def parse_settings
        @parser.on '-S', '--settings <f>', 'Load settings from file' do |f|
          @options[:settings] = f
        end
      end

      def parse_silent
        @parser.on '-s', '--silent', 'Try to turn off any messages' do
          @options[:silent] = true
        end
      end

      def parse_unload
        @parser.on '-u', '--unload', 'Skip heuristically loading gems' do
          @options[:unload] = true
        end
      end

      def parse_version
        @parser.on '-v', '--version', 'Print Sword’s version' do
          require 'sword/version'
          puts 'Sword ' + VERSION
          exit
        end
      end
    end
  end
end
