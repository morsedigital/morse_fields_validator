require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib/morse_fields_validator', __FILE__)
require 'morse_fields_validator'
require 'shoulda/matchers'
