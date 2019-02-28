require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.




class SQLObject
  def self.columns

    @columns ||= (
    c = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    
    SQL
    c[0].map {|col| col.to_sym}
    )
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        attributes[col]
      end
    end

    columns.each do |col|
      define_method("#{col}=") do |value|
        attributes[col] = value
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.underscore.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
    SELECT * FROM #{self.table_name}
    SQL
    self.parse_all(data)
  end

  def self.parse_all(results)
    objects = []
    results.each do |result|
      objects << self.new(result)
    end
    objects
  end

  def self.find(id)
    data = DBConnection.execute(<<-SQL, id: id)
    SELECT * FROM #{self.table_name}
    WHERE id = :id
    SQL
    parsed = self.parse_all(data)
    return nil if parsed == []
    parsed[0]
  end

  def initialize(params = {})
    params.each do |param, val|
      unless self.class.columns.include?(param.to_sym)
        raise "unknown attribute '#{param}'" 
      end
      send_name = (param.to_s + "=").to_sym
      self.send(send_name, val)
    end
  end


  def attributes
    @attributes ||= {}
    
  end

  def attribute_values
    self.class.columns.map { |col| self.send(col) }
  end

  def insert

    col_names = self.class.columns.join(", ")
    q_marks = []
    self.class.columns.length.times { q_marks << "?" }
    q_marks = q_marks.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES 
        (#{q_marks})
      
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_string = self.class.columns.map {|col| "#{col} = ?"}.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_string}
      WHERE
        id = ?
    SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
  end
end
