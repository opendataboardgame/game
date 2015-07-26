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