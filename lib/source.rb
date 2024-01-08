require "yaml"

module VectorSearchExample
  class Source
    #
    # @return [String]
    #
    def yaml_file
      File.join(__dir__, '..', 'data', './land.yaml')
    end

    def load_from_yaml
      YAML.load_file(yaml_file)
    end

    def select(&block)
      load_from_yaml.select { |location| block.call(location) }
    end
  end
end

