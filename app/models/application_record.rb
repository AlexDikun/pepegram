# spec/models/application_record.rb
# frozen_string_literal: true

# class describing the TOP model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
