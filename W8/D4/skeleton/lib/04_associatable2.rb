require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)

    define_method(name) do 
     
      through_options = self.class.assoc_options[through_name]
     
      source_options = through_options.model_class.assoc_options[source_name]
     
      select_string = source_options.table_name
      from_string = through_options.table_name
      join_string = "#{source_options.table_name} ON #{through_options.table_name}.#{source_options.foreign_key} = #{source_options.table_name}.#{source_options.primary_key}"

      where_string = "#{through_options.table_name}.#{through_options.primary_key} = ?"
      value = self.send(through_options.primary_key)

      data = DBConnection.execute(<<-SQL, value)
        SELECT
          #{select_string}.*
        FROM
          #{from_string}
        JOIN
          #{join_string}
        WHERE
          #{where_string}

         
          SQL
      source_options.model_class.parse_all(data).first
    end



  end
end


