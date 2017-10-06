class Contact < ApplicationRecord
  include MetadataHelpers

  has_many :phone_numbers
  has_many :callouts, :through => :phone_numbers
end
