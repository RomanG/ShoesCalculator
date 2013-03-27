print "How far will you drive in miles ?"
distance = gets.strip.chomp.to_f

print "What is the fuel efficiency of the car in miles per gallon ?"
MPG = gets.strip.chomp.to_f

print "What is the cost of gas per gallon ?"
gascost = gets.strip.chomp.to_f

print "How fast will you drive in miles per hour ?"
speed = gets.strip.chomp.to_f

hours = distance / speed
min = (hours - hours.floor) * 60
h = hours.floor.to_i
m = min.floor.to_i

if speed > 60
newMPG = MPG - (speed - 60) * 2
if newMPG <=0
puts "Gas Guzzler!"
else
cost = distance / newMPG * gascost
c = cost.to_i
puts "Your trip will take #{h} hours, #{m} minutes, and cost $#{c}."

end
else
cost = distance / MPG * gascost
c = cost.to_i
puts "Your trip will take #{h} hours, #{m} minutes, and cost $#{c}."
end
