require 'squib'

# sheets are created based on printing on A4 paper
# A4 paper = 8.3" x 11.7"
# 825 pixels @ 300 pixels/inch = 2.75"
# 1125 pixels @ 300 pixels/inch = 3.75"
# 8.3" - (3.75" x 2) = 0.8"
# 11.7" - (2.75" x 4) = 0.7"

Squib::Deck.new(cards: 1, width: 825, height: 1125, layout: 'layout.yml') do
  background color: '#FFFFFF'

  png file: "components/Card_Backgrounds/Mission_Back_BG.png", layout: 'Background'
  # png file: "templates/pokercard-portrait.png"
  
  text str: "Todo list", layout: 'TodoTitle'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck1'
  text str: "1 Take a data tile", layout: 'Todo1'
  text str: "no peeking!", layout: 'TodoSub1'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck2'
  text str: "2 Build tools", layout: 'Todo2'
  text str: "lay data tiles and negotiate!", layout: 'TodoSub2'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck3'
  text str: "A Place use markers", layout: 'Todo3'
  text str: "over each data tile you use", layout: 'TodoSub3'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck4'
  text str: "B Name your creation", layout: 'Todo4'
  text str: "use your imagination!", layout: 'TodoSub4'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck5'
  text str: "3 Discard one tool card", layout: 'Todo5'
  text str: "if you want to", layout: 'TodoSub5'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck6'
  text str: "4 Draw new tool cards", layout: 'Todo6'
  text str: "so you have three in your hand", layout: 'TodoSub6'
  svg file: "components/ToolCards_Icons/Todo_Checkbox.svg", layout: 'TodoCheck7'
  text str: "5 Draw an event card", layout: 'Todo7'
  text str: "only in the full version", layout: 'TodoSub7'

  save_png prefix: 'todo_'
end

Squib::Deck.new(cards: 9, width: 825, height: 1125, layout: 'layout.yml') do
  background color: '#FFFFFF'

  roles = csv file: 'roles/missions.csv'
  type = {}
  roles['type'].each_with_index{ |t,i| (type[t] ||= []) << i }
  focus = {}
  roles['focus'].each_with_index{ |t,i| (focus[t] ||= []) << i }

  png range: focus['Economic'], file: "components/Card_Backgrounds/Mission_Economy_Front_BG.png", layout: 'Background'
  png range: focus['Social'], file: "components/Card_Backgrounds/Mission_Social_Front_BG.png", layout: 'Background'
  png range: focus['Environmental'], file: "components/Card_Backgrounds/Mission_Environment_Front_BG.png", layout: 'Background'
  
  svg range: focus['Economic'], file: "components/ToolCards_Icons/Economic_Icon_Active.svg", layout: 'RoleFocusIcon'
  svg range: focus['Social'], file: "components/ToolCards_Icons/Social_Icon_Active.svg", layout: 'RoleFocusIcon'
  svg range: focus['Environmental'], file: "components/ToolCards_Icons/Environmental_Icon_Active.svg", layout: 'RoleFocusIcon'

  # png file: "templates/pokercard-portrait.png"
  
  text str: roles['name'], layout: 'RoleName'
  text range: type['business'], str: "BUSINESS", layout: 'RoleType'
  text range: type['third-sector'], str: "THIRD SECTOR", layout: 'RoleType'
  text range: type['public-sector'], str: "PUBLIC SECTOR", layout: 'RoleType'

  text range: 0, str: "You can only build tools that", layout: 'RoleDescriptionBusinessEconomic1'
  text range: 1, str: "You can only build tools that", layout: 'RoleDescriptionBusinessSocial1'
  text range: 2, str: "You can only build tools that", layout: 'RoleDescriptionBusinessEnvironmental1'

  text range: 0, str: "help the economy and people", layout: 'RoleDescriptionBusinessEconomic2'
  text range: 1, str: "help people and the environment", layout: 'RoleDescriptionBusinessSocial2'
  text range: 2, str: "help the environment and the economy", layout: 'RoleDescriptionBusinessEnvironmental2'

  text range: 0, str: "Only open data as part of a deal", layout: 'RoleDescriptionBusinessEconomic3'
  text range: 1, str: "Only open data as part of a deal", layout: 'RoleDescriptionBusinessSocial3'
  text range: 2, str: "Only open data as part of a deal", layout: 'RoleDescriptionBusinessEnvironmental3'

  text range: [3,6], str: roles['role'], layout: 'RoleDescriptionEconomic'
  text range: [4,7], str: roles['role'], layout: 'RoleDescriptionSocial'
  text range: [5,8], str: roles['role'], layout: 'RoleDescriptionEnvironmental'

  text str: "You win if", layout: 'RoleConditionTitle'
  text str: roles['condition'], layout: 'RoleCondition'

  save_png prefix: 'role_'
  hand file: 'business-role-example.png', range: [0], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  hand file: 'third-sector-role-example.png', range: [4], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  hand file: 'public-sector-role-example.png', range: [8], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  save_sheet prefix: 'roles_sheet_', columns: 4, rows: 2, margin: 105, trim: 37.5
end

Squib::Deck.new(cards: 39, width: 825, height: 1125, layout: 'layout.yml') do
  background color: '#FFFFFF'

  events = csv file: 'events/events.csv'

  type = {}
  events['type'].each_with_index{ |t,i| (type[t] ||= []) << i}
  impact = {}
  events['impact'].each_with_index{ |t,i| (impact[t] ||= []) << i unless type['media'].include?(i) }
  score = {}
  events['score'].each_with_index{ |t,i| (score[t.to_s] ||= []) << i }

  png range: type['crisis'], file: "components/Card_Backgrounds/TownCrisis_Front_BG.png", layout: 'Background'
  png range: type['media'], file: "components/Card_Backgrounds/MediaRelease_Front_BG.png", layout: 'Background'
  png range: impact['Economic'], file: "components/Card_Backgrounds/Event_Economy_Front_BG.png", layout: 'Background'
  png range: impact['Social'], file: "components/Card_Backgrounds/Event_Social_Front_BG.png", layout: 'Background'
  png range: impact['Environmental'], file: "components/Card_Backgrounds/Event_Environment_Front_BG.png", layout: 'Background'

  # png file: "templates/pokercard-portrait.png"

  svg range: type['impact'], file: events['impact'].map { |i| "components/ToolCards_Icons/#{i || "Economic"}_Icon_Active.svg" }, layout: 'EventEffectIcon'
  svg range: score['-1'], file: events['impact'].map { |i| "components/ToolCards_Penalties/Penalty_#{i || "Economic"}_1.svg" }, layout: 'EventScoreIcon'
  svg range: score['-2'], file: events['impact'].map { |i| "components/ToolCards_Penalties/Penalty_#{i || "Economic"}_2.svg" }, layout: 'EventScoreIcon'

  png range: type['impact'], file: "components/EventCards_Logos/EventCard_Logo_Evening Echo Logo.png", layout: 'EventLogoPaper'

  text range: type['impact'], str: events['title'], layout: 'EventImpactTitle'
  text range: type['impact'], str: events['subtitle'], layout: 'EventImpactSubtitle'
  text range: type['impact'], str: events['description'], layout: 'EventImpactDescription'

  png range: type['media'], file: "components/EventCards_Logos/EventCard_Logo_Mayors Office Logo.png", layout: 'EventLogoCouncil'
  svg range: type['media'], file: events['impact'].map { |i| "components/ToolCards_Icons/#{i || "Economic"}_Icon_Active.svg" }, layout: 'EventMediaImpact'
  text range: type['media'], str: "Media release", layout: 'EventMediaTitle'
  text range: type['media'], str: events['title'], layout: 'EventMediaSubtitle'
  text range: type['media'], str: events['description'], layout: 'EventMediaDescription'

  text range: type['crisis'], str: events['title'], layout: 'EventCrisisTitle'
  text range: type['crisis'], str: events['description'], layout: 'EventCrisisDescription'

  save_png prefix: 'event_'
  hand file: 'impact-event-example.png', range: [impact['Economic'][7]], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  hand file: 'media-event-example.png', range: [type['media'][0]], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  hand file: 'crisis-event-example.png', range: [type['crisis'][0]], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  save_sheet prefix: 'events_sheet_', columns: 4, rows: 2, margin: 105, trim: 37.5
end

Squib::Deck.new(cards: 63, width: 825, height: 1125, layout: 'layout.yml') do
  background color: '#FFFFFF'

  tools = csv file: 'tools/tools.csv'

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

  png file: "components/Card_Backgrounds/ToolRecipe_Front_BG.png", layout: 'Background'

  # png file: "templates/pokercard-portrait.png"

  text str: tools['category'], layout: 'ToolCategory'
  text str: tools['description'], layout: 'ToolDescription'

  svg range: type['singleton'], file: tools['data1'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{d}.svg" }, layout: 'ToolIcon'

  svg range: type['pair'], file: tools['data1'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{d}.svg" }, layout: 'Tool2Icon1'
  svg range: type['pair'], file: tools['data2'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool2Icon2'

  svg range: type['straight'], file: tools['data1'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{d}.svg" }, layout: 'Tool3Icon1'
  svg range: type['straight'], file: tools['data2'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool3Icon2'
  svg range: type['straight'], file: tools['data3'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool3Icon3'

  svg range: type['angle'], file: tools['data1'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{d}.svg" }, layout: 'Tool4Icon1'
  svg range: type['angle'], file: tools['data2'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool4Icon2'
  svg range: type['angle'], file: tools['data3'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool4Icon3'

  svg range: type['cluster'], file: tools['data1'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{d}.svg" }, layout: 'Tool5Icon1'
  svg range: type['cluster'], file: tools['data2'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool5Icon2'
  svg range: type['cluster'], file: tools['data3'].map { |d| "components/ToolCards_DataHexagons_Source/Data_IconHexagons_#{(d || 'Transport')}.svg" }, layout: 'Tool5Icon3'

  svg file: social.map { |i| i ? "components/ToolCards_Icons/Social_Icon_Active.svg" : "components/ToolCards_Icons/Social_Icon_Inactive.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "components/ToolCards_Icons/Environmental_Icon_Active.svg" : "components/ToolCards_Icons/Environmental_Icon_Inactive.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "components/ToolCards_Icons/Economic_Icon_Active.svg" : "components/ToolCards_Icons/Economic_Icon_Inactive.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_'
  save_sheet prefix: 'tools_sheet_', columns: 4, rows: 2, margin: 105, trim: 37.5
  hand file: 'tool-example.png', range: [59], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
  hand file: 'tools.png', range: [59,46], angle_range: (Math::PI / -4.0)..0, trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
end

Squib::Deck.new(cards: 1, width: 825, height: 1125, layout: 'layout.yml') do
  png file: "components/Card_Backgrounds/ToolRecipe_Back.png", layout: 'Background'
  hand file: 'tool-back-example.png', range: [0], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
end

Squib::Deck.new(cards: 1, width: 825, height: 1125, layout: 'layout.yml') do
  png file: "components/Card_Backgrounds/Event_Back.png", layout: 'Background'
  hand file: 'event-back-example.png', range: [0], angle_range: [0], trim: 37.5, trim_radius: 37.5, fill_color: '#0000'
end
