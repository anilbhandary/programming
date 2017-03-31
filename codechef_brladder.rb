################################################
# https://www.codechef.com/problems/BRLADDER
################################################
def figure(a, b)
  if a > b
    temp = a
    a = b
    b = temp
  end
  
  if (b-a) == 1 && a.odd?
    return "YES"
  elsif a.odd? && b.odd? && (b - a) == 2
    return "YES"
  elsif a.even? && b.even? && (b - a) == 2
    return "YES"
  else
    return "NO"
  end
end


q = gets.chomp.to_i
r = []
q.times do
  a, b = gets.chomp.split(' ')
  r << figure(a.to_i, b.to_i)
end

puts r
