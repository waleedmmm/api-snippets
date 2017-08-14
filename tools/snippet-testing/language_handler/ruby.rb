require_relative 'base_handler'

module LanguageHandler
  class Ruby < BaseHandler
    LANG_CNAME = 'rb'.freeze

    def self.run_before_test(directory)
      Dir.chdir(directory) do
        output = `rubocop -a`
        abort(output) if $CHILD_STATUS != 0
      end
    end

    private

    def execute_command(file)
      execute_with_suppressed_output(
        "rvm @#{dependencies_directory} do ruby #{file}",
        file
      )
    end

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      file_content.prepend(
        "require 'openssl'\n"\
        "OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE\n"
      )
    end
  end
end
