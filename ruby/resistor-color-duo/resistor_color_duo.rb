# frozen_string_literal: true

class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    COLORS.index(colors[0]) * 10 + COLORS.index(colors[1])
  end
end
