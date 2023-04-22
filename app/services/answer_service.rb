class AnswerService
  def initialize(question)
    @question = question
  end

  def fetch
    embedding_service = EmbeddingService.new(@question)
    nearest_chunks = embedding_service.knn
    prompt_service = PromptService.new(@question, nearest_chunks)
    prompt = prompt_service.create_prompt
    # Pass the prompt to ChatGPT to generate an answer
    answer = OpenaiService.new(prompt).fetch
    answer
  end
end
