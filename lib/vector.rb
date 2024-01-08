require "annoy"

module VectorSearchExample
  class Vector
    def initialize
      @db = Annoy::AnnoyIndex.new(n_features: 2, metric: 'euclidean')
    end

    #
    # @return [String]
    #
    def db_file
      File.join(__dir__, '..', 'db', 'annoy.bin')
    end

    #
    # @param [Array] records
    #
    def import(records)
      records.each { |r|
        @db.add_item(r[:id], [r[:latitude], r[:longitude]])
      }
      @db.build(10)
      save
    end

    def load
      @db.load(db_file)
    end
    
    def save
      @db.save(db_file)
    end

    def search(latlngs, size: 10, include_distances: false)
      @db.get_nns_by_vector(latlngs, size, include_distances: include_distances)
    end
  end
end
