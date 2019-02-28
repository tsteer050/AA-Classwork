require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    # debugger
    where_string = params.keys.map { |param| "#{param} = ?"}.join(" AND ")
    data = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_string}
    SQL
    self.parse_all(data)
  end
end

class SQLObject 
  extend Searchable
  
end

