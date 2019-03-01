require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.to_s.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
  
    @class_name = options[:class_name]
    @class_name ||= name.capitalize.to_s
    @foreign_key = options[:foreign_key]
    @foreign_key ||= (name.to_s + ("_id")).to_sym
    @primary_key = options[:primary_key]
    @primary_key ||= :id
    
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @class_name = options[:class_name]
    @class_name ||= name.to_s.singularize.capitalize
    @foreign_key = options[:foreign_key]
    @foreign_key ||= (self_class_name.to_s.singularize.downcase + ("_id")).to_sym
    @primary_key = options[:primary_key]
    @primary_key ||= :id
  end
end

module Associatable
  # Phase IIIb
    
  def belongs_to(name, options = {})
  
    options = BelongsToOptions.new(name, options)

    assoc_options
    @options[name] = options


    define_method(name) do 
      fkey = options.send(:foreign_key)
      value = self.send(fkey)
      target_class = options.model_class
      pkey = options.primary_key
   
      target_class.where(pkey => value).first
      
    end
  end



  def has_many(name, options = {})

    options = HasManyOptions.new(name, self, options)
    define_method(name) do 
      fkey = options.send(:foreign_key)
      target_class = options.model_class
      pkey = options.primary_key
      value = self.send(pkey)
   
      target_class.where(fkey.to_s => value)
    end
  end

  def assoc_options
     @options ||= {}
  end
end

class SQLObject
  extend Associatable
end
