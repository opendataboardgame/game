require 'squib'

Squib::Deck.new(cards: 36, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  events = csv file: 'events/events.csv'

  text str: events['description'], layout: 'EventText'
  svg file: events['impact'].map { |i| "world-board/#{i}.svg" }, layout: 'EventEffectIcon'
  text str: events['score'].map { |s| s > 0 ? "+#{s}" : s }, layout: 'EventEffectText'


  save_png prefix: 'event_'
  save_sheet prefix: 'events_sheet_', columns: 3, rows: 7, margin: 150, gap: 75
end

Squib::Deck.new(cards: 6, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  tiles = csv file: 'tiles/tiles.csv'

  svg file: tiles['data'].map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'ToolIcon'
  svg file: tiles['impact'].map { |i| i == 'Social' ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: tiles['impact'].map { |i| i == 'Environmental' ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: tiles['impact'].map { |i| i == 'Economic' ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_'
end