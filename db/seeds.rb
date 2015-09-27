#PanelProviders
panels = []
PanelProvider.destroy_all
panels << PanelProvider.create(code: '1234')
panels << PanelProvider.create(code: '2345')
panels << PanelProvider.create(code: '3456')

#Countries
Country.destroy_all
%w(pl uk de).each_with_index do |code, index|
   Country.create(country_code: code, panel_provider: panels[index])
end

#LocationGroups
location_groups = []
LocationGroup.destroy_all
0.upto(3) do |index|
  panel = index < 3 ? panels[index] : panels.sample
  location_groups << LocationGroup.create(name: "LocationGroup#{index + 1}", panel_provider: panel, country: panel.country)
end

#Locations
Location.destroy_all
location_groups.each do |lg|
  1.upto(5) do |index|
    Location.create(name: "Location#{index}", location_groups: [lg], external_id: SecureRandom.hex, secret_code: SecureRandom.hex)
  end
end
