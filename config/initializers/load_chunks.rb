# config/initializers/load_chunks.rb
require 'csv'

CSV_FILE_PATH = Rails.root.join('scripts/books/pg2009.pdf.chunks.csv')

$CHUNKS_DATA = CSV.read(CSV_FILE_PATH, headers: true, col_sep: "\t")
# puts $CHUNKS_DATA