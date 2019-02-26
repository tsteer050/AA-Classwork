require 'sqlite3'
require 'singleton'
require 'active_support/inflector'
require 'byebug'


class QuestionsDatabase < SQLite3::Database
    include Singleton 
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class QuestionsObject

    def self.all

        table = self.to_s.tableize
        data = QuestionsDatabase.instance.execute("SELECT * FROM #{table}")
        data.map { |datum| self.new(datum) }
    end

     def self.find_by_id(id)
        table = self.to_s.tableize
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                #{table}
            WHERE
                id = ?
        SQL
        data.map { |datum| self.new(datum) }
    end

    def self.find_by(*options)
        self.where(*options)
    end

    def self.where(options)
      
        where_string = ""
        table = self.to_s.tableize
        if options.is_a?(Hash)
            
            keys = options.keys 
            values = options.values

            

            keys.length.times do |i|
                
                sub_string = keys[i].to_s + " = '" + values[i].to_s + "'"
                unless i == keys.length - 1 
                    sub_string += " AND "
                end
                where_string += sub_string
            end
        else  
            where_string = options 
        end

        data = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                #{table}
            WHERE
                #{where_string}
        SQL
        data.map { |datum| self.new(datum) }

    end


    def save
        table = self.class.to_s.tableize
        instance_vars = self.instance_variables.map { |var| var.to_s[1..-1] }.drop(1)
            
        if self.id.nil?
            
           insert_string = table + " (" + instance_vars.join(", ") + ")"
           questionmarks = "(" + instance_vars.map {|ele| "?" }.join(", ") + ")"


            QuestionsDatabase.instance.execute(<<-SQL, *instance_vars)
                INSERT INTO
                    #{insert_string}
                VALUES
                    #{questionmarks}
            SQL
            self.id = QuestionsDatabase.instance.last_insert_row_id
        else 
            set = instance_vars.join(" = ?, ") + " = ?"
            QuestionsDatabase.instance.execute(<<-SQL, *instance_vars, self.id)
                UPDATE
                    #{table}
                SET
                    #{set}
                WHERE
                    id = ?
            SQL
        end 
    end

    
end




















