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

  save_png prefix: 'tool_1_'
end

Squib::Deck.new(cards: 21, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  data1 = []
  data2 = []
  social = []
  environmental = []
  economic = []

  tiles = csv file: 'tiles/tiles.csv'

  data = tiles['data']

  data.each_with_index do |d,i|
    rest = data[i..6]
    rest.each do |r|
      data1.push(d)
      data2.push(r)
      social.push(d == 'Democracy' || d == 'Health' || r == 'Democracy' || r == 'Health')
      environmental.push(d == 'Geography' || d == 'Weather' || r == 'Geography' || r == 'Weather')
      economic.push(d == 'Product' || d == 'Transport' || r == 'Product' || r == 'Transport')
    end
  end

  svg file: data1.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool2Icon1'
  svg file: data2.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool2Icon2'
  svg file: social.map { |i| i ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_2_'
end

Squib::Deck.new(cards: 18, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  data1 = []
  data2 = []
  data3 = []
  social = []
  environmental = []
  economic = []

  tiles = csv file: 'tiles/tiles.csv'

  data = tiles['data']

  data.each do |d1|
    for i in 1..3
      d2 = data[rand(6)]
      d3 = data[rand(6)]
      data1.push(d1)
      data2.push(d2)
      data3.push(d3)
      social.push(d1 == 'Democracy' || d1 == 'Health' || d2 == 'Democracy' || d2 == 'Health' || d3 == 'Democracy' || d3 == 'Health')
      environmental.push(d1 == 'Geography' || d1 == 'Weather' || d2 == 'Geography' || d2 == 'Weather' || d3 == 'Geography' || d3 == 'Weather')
      economic.push(d1 == 'Product' || d1 == 'Transport' || d2 == 'Product' || d2 == 'Transport' || d3 == 'Product' || d3 == 'Transport')
    end
  end

  svg file: data1.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool3Icon1'
  svg file: data2.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool3Icon2'
  svg file: data3.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool3Icon3'
  svg file: social.map { |i| i ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_3_'
end

Squib::Deck.new(cards: 18, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  data1 = []
  data2 = []
  data3 = []
  social = []
  environmental = []
  economic = []

  tiles = csv file: 'tiles/tiles.csv'

  data = tiles['data']

  data.each do |d1|
    for i in 1..3
      d2 = data[rand(6)]
      d3 = data[rand(6)]
      data1.push(d1)
      data2.push(d2)
      data3.push(d3)
      social.push(d1 == 'Democracy' || d1 == 'Health' || d2 == 'Democracy' || d2 == 'Health' || d3 == 'Democracy' || d3 == 'Health')
      environmental.push(d1 == 'Geography' || d1 == 'Weather' || d2 == 'Geography' || d2 == 'Weather' || d3 == 'Geography' || d3 == 'Weather')
      economic.push(d1 == 'Product' || d1 == 'Transport' || d2 == 'Product' || d2 == 'Transport' || d3 == 'Product' || d3 == 'Transport')
    end
  end

  svg file: data1.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool4Icon1'
  svg file: data2.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool4Icon2'
  svg file: data3.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool4Icon3'
  svg file: social.map { |i| i ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_4_'
end

Squib::Deck.new(cards: 18, width: 1050, height: 675, layout: 'layout.yml') do
  background color: '#FFFFFF'

  data1 = []
  data2 = []
  data3 = []
  social = []
  environmental = []
  economic = []

  tiles = csv file: 'tiles/tiles.csv'

  data = tiles['data']

  data.each do |d1|
    for i in 1..3
      d2 = data[rand(6)]
      d3 = data[rand(6)]
      data1.push(d1)
      data2.push(d2)
      data3.push(d3)
      social.push(d1 == 'Democracy' || d1 == 'Health' || d2 == 'Democracy' || d2 == 'Health' || d3 == 'Democracy' || d3 == 'Health')
      environmental.push(d1 == 'Geography' || d1 == 'Weather' || d2 == 'Geography' || d2 == 'Weather' || d3 == 'Geography' || d3 == 'Weather')
      economic.push(d1 == 'Product' || d1 == 'Transport' || d2 == 'Product' || d2 == 'Transport' || d3 == 'Product' || d3 == 'Transport')
    end
  end

  svg file: data1.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool5Icon1'
  svg file: data2.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool5Icon2'
  svg file: data3.map { |d| "tiles/#{d.downcase}-closed.svg" }, layout: 'Tool5Icon3'
  svg file: social.map { |i| i ? "world-board/Social.svg" : "world-board/Social-light.svg" }, layout: 'ToolImpactIcon1'
  svg file: environmental.map { |i| i ? "world-board/Environmental.svg" : "world-board/Environmental-light.svg" }, layout: 'ToolImpactIcon2'
  svg file: economic.map { |i| i ? "world-board/Economic.svg" : "world-board/Economic-light.svg" }, layout: 'ToolImpactIcon3'

  save_png prefix: 'tool_5_'
end