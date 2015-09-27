class CreateCountriesTargetGroupsTable < ActiveRecord::Migration
  def change
    create_table :countries_target_groups, id: false do |t|
      t.belongs_to :country, index: true
      t.belongs_to :target_group, index: true
    end
  end
end
