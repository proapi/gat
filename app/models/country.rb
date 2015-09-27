class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups
end
