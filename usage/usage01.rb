require_relative '../lib/dentaku'
require 'time_array'

# Modifico il metodo divide
Dentaku::BinaryOperation.class_eval do
  def divide; [:numeric, left / right];  end
end

class Col < Array
  def -(arr)
    raise "Array are not the same size" if size!=arr.size
    map.with_index{|e,i| e-arr[i]}
  end

  def +(arr)
    raise "Array are not the same size" if size!=arr.size
    map.with_index{|e,i| e+arr[i]}
  end

  def *(num)
    map{|e| (e*num).to_f}
  end

  def /(num)
    map{|e| (e/num.to_f).to_f}
  end
end

t1 = TimeArray::TimeArray.new("2014", [1,2,3,4,5,6,7,8,9,10,11,12], unit: :month)
t2 = TimeArray::TimeArray.new("2014", [3,1,2,8,3,1,4,14,7,22,11,9], unit: :month)
c = Dentaku::Calculator.new
c.store(a: t1)
c.store(b: t2)
c.store(e: 5)


puts c.evaluate!('a').inspect

# puts c.evaluate('a-b').inspect
# puts c.evaluate('a+b').inspect
# puts c.evaluate('a/2.0').inspect
# puts c.evaluate('a*e').inspect

