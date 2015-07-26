require 'squib'

Squib::Deck.new(cards: 36, height: 216, width: 336, layout: 'layout.yml') do
  background color: '#FFFFFF'

  events = csv file: 'events/events.csv'

  text str: events['description'], layout: 'EventText'

  save_png prefix: 'event_', rotate: true
end
