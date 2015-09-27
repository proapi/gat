class CreateLocationGroupsLocationsTable < ActiveRecord::Migration
  def change
    create_table :location_groups_locations do |t|
      t.belongs_to :location_group, index: true
      t.belongs_to :location, index: true
    end
  end
end
