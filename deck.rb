require 'squib'

# sheets are created based on printing on A4 paper
# A4 paper = 8.3" x 11.7"
# 825 pixels @ 300 pixels/inch = 2.75"
# 1125 pixels @ 300 pixels/inch = 3.75"
# 8.3" - (3.75" x 2) = 0.8"
# 11.7" - (2.75" x 4) = 0.7"

Squib::Deck.new(cards: 9, width: 1125, height: 825, layout: 'layout.yml') do
  background color: '#FFFFFF'

  roles = csv file: 'roles/missions.csv'

  png file: "templates/pokercard.png"
  text str: roles['name'], layout: 'RoleName'
  text str: roles['role'], layout: 'RoleDescription'
  text str: "You win if", layout: 'RoleConditionTitle'
  text str: roles['condition'], layout: 'RoleCondition'
  text str: "Why?", layout: 'RoleWhyTitle'
  text str: roles['why'], layout: 'RoleWhy'
  svg file: roles['focus'].map { |i| "world-board/#{i}.svg" }, layout: 'RoleFocusIcon'

  save_png prefix: 'role_'
  save_sheet prefix: 'roles_sheet_', columns: 2, rows: 4, margin: 105
end

Squib::Deck.new(cards: 39, width: 1125, height: 825, layout: 'layout.yml') do
  background color: '#FFFFFF'

  events = csv file: 'events/events.csv'

  type = {}
  events['type'].each_with_index{ |t,i| (type[t] ||= []) << i}

  png file: "templates/pokercard.png"

  text range: type['role'], str: events['title'], layout: 'EventTitle'
  text range: type['role'], str: events['description'], layout: 'EventDescription'

  text range: type['legislation'], str: "New legislation", layout: 'EventTitle'
  text range: type['legislation'], str: events['title'].map { |c| "All* #{c} data must be open" }, layout: 'EventDescription'
  text range: type['legislation'], str: "* Except private data", layout: 'EventDisclaimer'

  text range: type['impact'], str: events['title'], layout: 'EventTitle'
  svg range: type['impact'], file: events['impact'].map { |i| "world-board/#{i || "Economic"}.svg" }, layout: 'EventEffectIcon'
  text range: type['impact'], str: events['score'], layout: 'EventEffectText'

  save_png prefix: 'event_'
  save_sheet prefix: 'events_sheet_', columns: 2, rows: 4, margin: 105
end

Squib::Deck.new(cards: 63, width: 1125, height: 825, layout: 'layout.yml') do
  background color: '#FFFFFF'

  tools = csv file: 'tools/tools.csv'
  tiles = csv file: 'tiles/tiles.csv'

  type = {}
  tools['type'].each_with_index{ |t,i| (type[t] ||= []) << i}

  social = []
  environmental = []
  economic = []
  tools['type'].each_with_index do |t,i|
    d1 = tools['data1'][i]
    d2 = tools['data2'][i]
    d3 = tools['data3'][i]
    social.push(d1 == 'Democracy' || d1 == 'Health' || d2 == 'Democracy' || d2 == 'Health' || d3 == 'Democracy' || d3 == 'Health')
    environmental.push(d1 == 'Geography' || d1 == 'Weather' || d2 == 'Geography' || d2 == 'Weather' || d3 == 'Geography' || d3 == 'Weather')
    economic.push(d1 == 'Product' || d1 == 'Transport' || d2 == 'Product' || d2 == 'Transport' || d3 == 'Product' || d3 == 'Transport')
  end

  png file: "templates/pokercard.png"

  svg range: type['singleton'], file: tools['data1'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'ToolIcon'

  svg range: type['pair'], file: tools['data1'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool2Icon1'
  svg range: type['pair'], file: tools['data2'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool2Icon2'

  svg range: type['straight'], file: tools['data1'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool3Icon1'
  svg range: type['straight'], file: tools['data2'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool3Icon2'
  svg range: type['straight'], file: tools['data3'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool3Icon3'

  svg range: type['angle'], file: tools['data1'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool4Icon1'
  svg range: type['angle'], file: tools['data2'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool4Icon2'
  svg range: type['angle'], file: tools['data3'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool4Icon3'

  svg range: type['cluster'], file: tools['data1'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool5Icon1'
  svg range: type['cluster'], file: tools['data2'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool5Icon2'
  svg range: type['cluster'], file: tools['data3'].map { |d| "tiles/#{(d || 'Transport').downcase}-closed.svg" }, layout: 'Tool5Icon3'

  svg file: social.map { |i| i ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  text str: tools['description'], layout: 'ToolDescription'

  save_png prefix: 'tool_'
  save_sheet prefix: 'tools_sheet_', columns: 2, rows: 4, margin: 105
  hand file: 'tools.png', range: [59,46], angle_range: (Math::PI / -4.0)..0, trim: 38, trim_radius: 38, fill_color: '#0000'
end
