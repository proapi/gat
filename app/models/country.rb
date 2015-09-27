class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :location_groups, dependent: :destroy
  has_and_belongs_to_many :target_groups, -> (country) { where(parent_id: nil, panel_provider_id: country.panel_provider_id) }
  has_many :locations, through: :location_groups
end
