# frozen_string_literal: true

class MoveGenreFromAuthorsToBooks < ActiveRecord::Migration[5.2]
  class GenericAuthor < ApplicationRecord
    self.table_name = 'authors'
  end

  class GenericBook < ApplicationRecord
    self.table_name = 'books'
  end

  def up
    add_column :books, :genre, :string

    # comment out this line to experiment with caching behavior
    GenericBook.reset_column_information

    GenericAuthor.find_each do |author|
      book = GenericBook.find_by(author_id: author.id)

      puts "Moving #{author.genre} from #{author.name} to #{book.title}"

      update_attrs = { genre: author.genre }
      book.update!(update_attrs)
    end

    puts "\n### Genres have supposedly been migrated ###\n\n"

    GenericBook.find_each do |book|
      puts "The genre of #{book.title} is #{book.genre || 'ø'}"
    end
  end

  def down
    remove_column :books, :genre
  end
end
