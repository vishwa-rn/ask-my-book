require 'openai'
require 'dotenv'
Dotenv.load

def generate_embeddings(text, client)
  response = client.embeddings(
    parameters: {
      model: "text-embedding-ada-002",
      input: text
    }
  )
  # puts response

  response
end


require 'csv'

input_csv_filename = 'books/pg2009.pdf.chunks.csv'
output_csv_filename = 'books/pg2009.pdf.chunks.embeddings.csv'

rows = []
client = OpenAI::Client.new(access_token: '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')

counter = 0
CSV.open(output_csv_filename, 'w', col_sep: "\t") do |csv|
  csv << ['page_number', 'chunk_index', 'content', 'embeddings']
  CSV.foreach(input_csv_filename, headers: true, col_sep: "\t") do |row|
    counter += 1
    puts "processing row #{counter}"
    content = row['content']
    embeddings = generate_embeddings(content, client)
    temp_row = row.to_h.merge('embedding': embeddings['data'][0]['embedding'])
    csv << [temp_row['page_number'], temp_row['chunk_index'], temp_row['content'], temp_row[:embedding]]
  end
end
