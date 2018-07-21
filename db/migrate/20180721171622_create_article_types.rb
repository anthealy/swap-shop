class CreateArticleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_types do |t|
      t.integer :article_id
      t.integer :type_id
    end
  end
end
