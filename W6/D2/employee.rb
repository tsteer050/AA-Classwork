class Employee 
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    bonus = self.salary * multiplier
    bonus
  end

end


class Manager < Employee
    attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
    
  end

  def bonus(multiplier)
    bonus = employees_total_salary(self.employees) * multiplier 
    bonus
  end

  def employees_total_salary(employees)
    total = 0
    employees.each do |employee|
        if employee.is_a?(Manager)
            total += employee.salary
            total += employee.employees_total_salary(employee.employees)
        else
            total += employee.salary
        end
    end
    total
  end
end

david = Employee.new("David", "TA", 10000, "Darren")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [david, shawna])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000