class LocationGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
  has_and_belongs_to_many :locations

  private

  def validate
    errors[:base] << 'country.panel_provider_id and panel_provider_id are not the same' if panel_provider_id != country.panel_provider_id
  end
end
