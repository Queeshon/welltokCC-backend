class CreateTagarticles < ActiveRecord::Migration[5.1]
  def change
    create_table :tagarticles do |t|
      t.belongs_to :article, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
