# frozen_string_literal: true

# Add `lib` dir to `$LOAD_PATH`
APP_ROOT = File.expand_path('.')
$LOAD_PATH.unshift(File.expand_path("#{APP_ROOT}/lib"))

require 'bundler/setup'
require 'fibonacci'
