require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'import.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  article = Article.new
  article.title = row['title']
  article.description = row['description']
  if Author.find_by(name: row['author'])
    article.author = Author.find_by(name: row['author'])
  else
    article.author = Author.create(name: row['author'])
  end
  row['tags'].each do |tag|
    if !article.tags.find_by(name: tag)
      article.author = Tag.create(name: tag)
    end
  end
  article.save
end
