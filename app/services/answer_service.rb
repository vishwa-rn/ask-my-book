class AnswerService
  def initialize(question)
    @question = question
  end

  def fetch
    # Check if the answer is already cached in the database
    cached_answer = CachedAnswer.find_by(question: @question)

    puts cached_answer

    # Return the cached answer if found
    return cached_answer.answer if cached_answer
    puts "Answer not cached. Fetching from OpenAI..."

    # If the answer is not cached, proceed with fetching an answer from OpenAI
    embedding_service = EmbeddingService.new(@question)
    nearest_chunks = embedding_service.knn
    prompt_service = PromptService.new(@question, nearest_chunks)
    prompt = prompt_service.create_prompt
    # Pass the prompt to ChatGPT to generate an answer
    answer = OpenaiService.new(prompt).fetch

    # Cache the answer in the database
    CachedAnswer.create(question: @question, answer: answer)

    answer
  end
end
