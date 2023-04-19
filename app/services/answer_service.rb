# app/services/answer_service.rb
class AnswerService
  def initialize(question)
    @question = question
  end

  def fetch
    # # Fetch the most relevant embedding and check cache
    # embedding_id = EmbeddingService.new(@question).find_nearest
    # answer = Rails.cache.fetch(embedding_id)

    # # If answer not in cache, hit OpenAI API
    # unless answer
    #   answer = OpenAIService.new(@question).fetch
    #   Rails.cache.write(embedding_id, answer)
    # end
    answer = OpenaiService.new(@question).fetch
    answer
  end
end
