#clear db
TargetGroup.destroy_all
Location.destroy_all
LocationGroup.destroy_all
Country.destroy_all
PanelProvider.destroy_all

#PanelProviders
panels = []
panels << PanelProvider.create(code: '1234', price_type: 1)
panels << PanelProvider.create(code: '2345', price_type: 2)
panels << PanelProvider.create(code: '3456', price_type: 3)

#Countries
%w(pl uk de).each_with_index do |code, index|
   Country.create(country_code: code, panel_provider: panels[index])
end

#LocationGroups
location_groups = []
0.upto(3) do |index|
  panel = index < 3 ? panels[index] : panels.sample
  location_groups << LocationGroup.create(name: "LocationGroup#{index + 1}", panel_provider: panel, country: panel.country)
end

#Locations
location_groups.each do |lg|
  1.upto(5) do |index|
    Location.create(name: "Location#{index}", location_groups: [lg], external_id: SecureRandom.hex, secret_code: SecureRandom.hex)
  end
end

#TargetGroups
0.upto(3) do |index|
  panel = index < 3 ? panels[index] : panels.sample
  TargetGroup.create(name: "TargetGroup#{index + 1}", panel_provider: panel, external_id: SecureRandom.hex, secret_code: SecureRandom.hex, parent: nil).create_children
end

#Countries <-> TargetGroups relationships
TargetGroup.all.each do |tg|
  tg.countries << tg.panel_provider.country
  tg.save
end

#ApiToken just to not create it from console for the first time
ApiToken.create
