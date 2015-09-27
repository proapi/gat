class PanelProvider < ActiveRecord::Base
  has_one :country
  has_one :target_group
  has_one :location_group
end
