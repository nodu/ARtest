class CreateArticles < ActiveRecord::Migration
  def change
    # no id since ActiveRecord using serialized id's unque to the table
    # t.boolean :published, default: false # to make it default to false
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
