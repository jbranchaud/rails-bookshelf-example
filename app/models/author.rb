# frozen_string_literal: true

class Author < ApplicationRecord
  has_one :book
end
