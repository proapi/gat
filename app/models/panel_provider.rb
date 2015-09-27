class PanelProvider < ActiveRecord::Base
  has_one :country, dependent: :destroy
  has_one :target_group, dependent: :destroy
  has_one :location_group, dependent: :destroy

  def price
    Price.get_price(price_type)
  end
end
