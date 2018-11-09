class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :article_id
      t.string :title
      t.string :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
