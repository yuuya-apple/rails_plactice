# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, precence: true
end
