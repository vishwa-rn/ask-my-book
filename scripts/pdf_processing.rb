def tokenize(text)
  text.split(/\W+/)
end


def chunk_text(text, max_tokens)
  tokens = tokenize(text)
  chunks = []
  current_chunk = []

  tokens.each do |token|
    if current_chunk.size + 1 <= max_tokens
      current_chunk << token
    else
      chunks << current_chunk.join(' ')
      current_chunk = [token]
    end
  end
  chunks << current_chunk.join(' ') unless current_chunk.empty?

  chunks
end


require 'pdf/reader'
require 'daru'

filename = 'books/pg2009.pdf'
max_tokens = 2048

reader = PDF::Reader.new(filename)

chunks = []
page_number = 1

reader.pages.each do |page|
  text = page.text
  page_chunks = chunk_text(text, max_tokens)
  page_chunks.each_with_index do |chunk, index|
    chunks << { page_number: page_number, chunk_index: index + 1, content: chunk }
  end
  page_number += 1
end

df = Daru::DataFrame.new(chunks, order: [:page_number, :chunk_index, :content])

require 'csv'

csv_filename = "#{filename}.chunks.csv"
CSV.open(csv_filename, 'w', col_sep: "\t") do |csv|
  csv << ['page_number', 'chunk_index', 'content']
  df.each_row do |row|
    csv << row.to_a
  end
end
