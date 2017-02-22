# def h1
#   print "<h1>"
#   print yield
#   print "</h1>"
# end
#
# def h2
#   print "<h2>"
#   print yield
#   print "</h2>"
# end

def tag(tag)
  print "<#{tag}>"
  print yield
  print "</#{tag}>"
end

# h1 {"Breakign News!"}
# h2 {"Massive Ruby Discovered"}
puts  tag(:h1) { "Breaking News!" }
puts tag(:h2) { "Massive Ruby Discovered" }


tag(:ul) do
  tag(:li){ "It sparkels!"}
  tag(:li){ "It shines!"}
  tag(:li){ "It mesemerizes!"}
end
