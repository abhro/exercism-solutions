class Matrix

  def initialize(matrix_str)
    @matrix = matrix_str
  end

  def rows
    @rows ||= extract_rows
  end

  def columns
    rows.transpose
  end

  def extract_rows
    @matrix.each_line.map do |row|
      row.scan(/\d+/).map { |cell| Integer(cell) }
    end
  end
end
