# app/services/embedding_service.rb
class EmbeddingService
  def initialize(text)
    @text = text
  end

  def get_embedding
    OpenaiService.embed_text(@text)
  end

  def knn(k = 5)
    query_embedding = get_embedding
    query_embedding = query_embedding['data'][0]['embedding']
    distances = {}
    $CHUNKS_EMBEDDING_DATA.each_with_index do |chunk_embedding, index|
      distances[index] = cosine_similarity(query_embedding, chunk_embedding['embeddings'])
    end
    nearest_indices = distances.sort_by { |_, value| -value }.first(k).map(&:first)
    nearest_indices.map { |index| $CHUNKS_DATA[index] }
  end

  private

  def cosine_similarity(vec1, vec2)
    dot_product = vec1.zip(vec2).map { |a, b| a * b }.sum
    magnitude = Math.sqrt(vec1.map { |x| x**2 }.sum) * Math.sqrt(vec2.map { |x| x**2 }.sum)
    dot_product / magnitude
  end
end
