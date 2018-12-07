require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  article = Article.new
  article.title = row['title']
  article.description = row['description']
  article.created_at = row['created_at']
  article.updated_at = row['updated_at']
  if Author.find_by(name: row['author'])
    article.author = Author.find_by(name: row['author'])
  else
    article.author = Author.create(name: row['author'])
  end
  article.save
  row['tags'].split(', ').each do |tag|
    article.tags.find_or_create_by(name: tag)
  end
end
