# app/services/openai_service.rb
require 'openai'

class OpenaiService
  def initialize(question)
    @question = question
  end

  def fetch
    # Initialize OpenAI API
    # openai_client = OpenAI::Client.new(api_key: "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", default_engine: "ada")
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: @question}], # Required.
        temperature: 0.7,
    })
    answer = response.dig("choices", 0, "message", "content")
    # puts answer


    # Generate answer using OpenAI API (replace with your specific implementation)
    # response = OpenAI.generate_answer(@question)
    answer
  end

  def self.embed_text(text)
    # Call the OpenAI API to get the embeddings for the given text
    # Return the embeddings
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    response = client.embeddings(
      parameters: {
        model: "text-embedding-ada-002",
        input: text
      }
    )
    # puts response
    response
  end
end
