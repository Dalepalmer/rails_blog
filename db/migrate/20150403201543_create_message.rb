class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.string :to
      t.string :from
      t.string :media_url
    end
  end
end
