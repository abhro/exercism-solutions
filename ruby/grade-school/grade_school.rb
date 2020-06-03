# frozen_string_literal: true

class School
  def initialize
    @students = Hash.new { [] }
  end

  def add(student, grade)
    @students[grade] = [*@students[grade], student].sort
  end

  alias << add

  def students(grade)
    @students[grade]
  end

  def students_by_grade
    records = []
    @students.each_pair do |grade, students|
      records << { grade: grade, students: students }
    end
    records.sort { |a, b| a[:grade] <=> b[:grade] }
  end
end
