class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.string :external_ip
      t.string :secret_code
      t.references :panel_provider, index: true

      t.timestamps null: false
    end
    add_foreign_key :target_groups, :panel_providers
  end
end
