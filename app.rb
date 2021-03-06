require 'httparty'

SEP = '***********************************************'

today    = Date.today.to_s
tomorrow = Date.today + 1
tomorrow = tomorrow.to_s

puts SEP
print "Which City Do You Live In?\n>> "
city = gets.chomp
puts SEP

url = "https://api.seatgeek.com/2/events\?venue.city\=#{city}\&datetime_utc.gte\=
  #{today}\&datetime_utc.lte\=#{tomorrow}"
response  = HTTParty.get(url)
json_hash = response.parsed_response

json_hash["events"].each do |event|
  puts event["title"]
end

puts SEP
