# frozen_string_literal: true

fowler = Author.create(name: 'Martin Fowler', genre: 'technical')
butler = Author.create(name: 'Octavia Butler', genre: 'science fiction')
sedaris = Author.create(name: 'David Sedaris', genre: 'essay')

Book.create(
  [
    { title: 'Refactoring', publication_year: 2018, author: fowler },
    { title: 'Fledgling', publication_year: 2005, author: butler },
    { title: 'Me Talk Pretty One Day', publication_year: 2000, author: sedaris }
  ]
)
