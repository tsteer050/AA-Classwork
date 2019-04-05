json.array! @parties do |party|
  json.extract! party, :name, :location
  json.guests do 
    json.array! party.guests do |guest|
      if guest.age >= 40 && guest.age <= 50
        json.name guest.name
      end
    end
  end
end