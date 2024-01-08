require "yaml"

id = 0
puts YAML.load_file('./data/original.yaml').map { |prefecture|
  name = prefecture['prefecture']
  cities = prefecture['cities']
  cities.map { |city|
    id = id + 1
    {
      id: id,
      name: name + city['name'],
      latitude: city['latitude'],
      longitude: city['longitude']
    }
  }
}.flatten.to_yaml
