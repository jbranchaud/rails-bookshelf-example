# frozen_string_literal: true

class SeedAFewBooksAndAuthors < ActiveRecord::Migration[5.2]
  class GenericAuthor < ApplicationRecord
    self.table_name = 'authors'
  end

  class GenericBook < ApplicationRecord
    self.table_name = 'books'
  end

  def up
    fowler = GenericAuthor.create(name: 'Martin Fowler', genre: 'technical')
    butler = GenericAuthor.create(name: 'Octavia Butler', genre: 'science fiction')
    sedaris = GenericAuthor.create(name: 'David Sedaris', genre: 'essay')

    GenericBook.create(
      [
        { title: 'Refactoring', publication_year: 2018, author_id: fowler.id },
        { title: 'Fledgling', publication_year: 2005, author_id: butler.id },
        { title: 'Me Talk Pretty One Day', publication_year: 2000, author_id: sedaris.id }
      ]
    )
  end

  def down
    execute 'delete from books;'
    execute 'delete from authors;'
  end
end
