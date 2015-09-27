class PanelProvider < ActiveRecord::Base
  has_one :country, dependent: :destroy
  has_one :target_group
  has_one :location_group
end
