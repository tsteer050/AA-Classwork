# PHASE 2
def convert_to_int(str)
  return Integer(str)
  rescue ArgumentError => e 
    return nil
end



# We want our dear user to be able to call convert_to_int 
# with no error being raised on invalid input. Update 
# convert_to_int to rescue any errors and return nil if 
# our argument cannot be converted.

# If we are handling the error thrown by Integer(arg),
#  which StandardError subclass should we be catching? Next,
#   update convert_to_int again to only rescue the correct
#    exception type.

# NB: rescue only rescues StandardError and its subclasses.
#  Any other Exception subclass is a system error and implies 
#  that something rather serious has gone wrong and our code should
#   stop executing.

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise NoCoffeeError
  else
    raise StandardError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue NoCoffeeError 
    puts "I don't like coffee"
    retry
  rescue 
    puts "That's not fruit"
  end
  
end  

class NoCoffeeError < StandardError

end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      raise StringLengthError if name.length <= 0 || fav_pastime.length <= 0
      @name = name
      raise YrsKnownError if yrs_known < 5
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    rescue YrsKnownError
      puts "We haven't known each other long enough"
    rescue StringLengthError
      puts "You didn't enter a name or passtime"
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class YrsKnownError < ArgumentError
end

class StringLengthError < ArgumentError
end

