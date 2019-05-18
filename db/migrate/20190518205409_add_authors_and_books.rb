# frozen_string_literal: true

class AddAuthorsAndBooks < ActiveRecord::Migration[5.2]
  def up
    execute 'create extension pgcrypto;'

    create_table :authors, id: :uuid do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.timestamps null: false
    end

    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.integer :publication_year, null: false
      t.timestamps null: false

      t.references :author, type: :uuid, index: true, foreign_key: true
    end
  end

  def down
    drop_table :books
    drop_table :authors
    execute 'drop extension pgcrypto;'
  end
end
