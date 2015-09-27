class RenameExternalColumnInTargetGroups < ActiveRecord::Migration
  def change
    rename_column :target_groups, :external_ip, :external_id
  end
end
