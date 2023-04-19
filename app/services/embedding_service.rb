# app/services/embedding_service.rb
require 'nmslib'
require 'json'

class EmbeddingService
  def initialize(question)
    @question = question
  end

  def find_nearest
    index = Nmslib.init(space: 'cosinesimil')
    data = JSON.parse(File.read("data.json"))

    data.each { |item| index.addDataPoint(id: item['id'], vector: item['embedding']) }
    index.createIndex()

    nearest_neighbor = index.knnQuery(@question, k: 1)
    nearest_neighbor.first[:id]
  end
end
