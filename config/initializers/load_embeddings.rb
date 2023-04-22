# Load the embeddings data from the CSV file
require 'csv'

CHUNKS_EMBEDDING_FILE_PATH = Rails.root.join('scripts/books/pg2009.pdf.chunks.embeddings.csv')

$CHUNKS_EMBEDDING_DATA = CSV.read(CHUNKS_EMBEDDING_FILE_PATH, headers: true, col_sep: "\t")

$CHUNKS_EMBEDDING_DATA.each do |row|
  row['embeddings'] = JSON.parse(row['embeddings'])
end
