# app/services/prompt_service.rb
class PromptService
  def initialize(question, nearest_chunks)
    @question = question
    @nearest_chunks = nearest_chunks
  end

  def create_prompt
    chunks_text = @nearest_chunks.join("\n")
    question = "I have a question:\n#{@question}\n\nRelevant information:\n#{chunks_text}\n\nAnswer:"
    # puts question
    question
  end
end
