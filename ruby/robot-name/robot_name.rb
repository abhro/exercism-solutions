# frozen_string_literal: true

require 'set'

#
# Simulate a robot with only name-capabilities
#
class Robot
  NAME_POOL = ('AA000'..'ZZ999').to_a.freeze
  private_constant :NAME_POOL

  def initialize
    reset # a new robot is a factory settings robot
  end

  #
  # Revert to fatory settings
  #
  def reset
    @name_idx = nil
  end

  def name
    return NAME_POOL[@name_idx] unless @name_idx.nil?

    @name_idx = rand(NAME_POOL.length) while @@picked_names.include?(@name_idx)
    @@picked_names << @name_idx

    NAME_POOL[@name_idx]
  end

  def self.forget
    @@picked_names = Set[nil]
  end

  forget
end
