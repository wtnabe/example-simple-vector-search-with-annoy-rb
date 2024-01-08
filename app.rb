require_relative "./lib/source"
require_relative "./lib/vector"

def main(argv = ARGV.dup)
  case argv[0]
  when 'prepare'
    prepare_db
  else
    search(normalize_args(argv[0, 2]))
  end
end

#
# @param [Array] latlngs
#
def search(latlngs)
  source = VectorSearchExample::Source.new

  vector = VectorSearchExample::Vector.new
  vector.load

  result = vector.search(latlngs, size: 10, include_distances: false)
  case result.size
  when 2
    indexes, distances = result
  else
    indexes = result
  end

  puts indexes.map.with_index { |idx, i|
    source.select { |location|
      location[:id] == idx
    }.map { |location|
      location[:distance] = distances[i] if distances
      location
    }
  }
end

#
# @param [Array] latlng
# @return [Array]
#
def normalize_args(latlngs)
  splitted =
    case latlngs.size
    when 2
      latlngs.map { |l| l.tr(',', '') }
    when 1
      latlngs.to_s.split(',')
    end

  splitted.map { |l| l.to_f }
end
  
def prepare_db
  db = VectorSearchExample::Vector.new
  db.import(VectorSearchExample::Source.new.load_from_yaml)
end

if __FILE__ == $0
  main
end
