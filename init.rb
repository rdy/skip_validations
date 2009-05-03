require File.expand_path(File.join(File.dirname(__FILE__), '/lib/skip_validations'))
ActiveRecord::Base.extend SkipValidations
