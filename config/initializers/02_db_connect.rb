# frozen_string_literal: true

require 'active_record'
require 'erb'

config_file = File.new('config/database.yml.erb').read
erb_template = ERB.new(config_file)
db_config = YAML.safe_load(erb_template.result(binding))

ActiveRecord::Base.establish_connection(db_config)
