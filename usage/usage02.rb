require_relative '../lib/dentaku'

c = Dentaku::Calculator.new
c.store("a" => 4.7)

puts c.evaluate!('a+1').inspect


require 'bigdecimal'

x = BigDecimal.new(3.11234234, 4)
puts (x*2).floor.class