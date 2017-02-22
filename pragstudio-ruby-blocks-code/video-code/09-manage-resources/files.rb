f = File.open("letter.txt", "w")
f.puts "Hello!"
f.puts "Goodbye."
f.close

f = File.open("letter.txt", "r")
puts f.gets
puts f.gets
f.close

File.open("letter.txt", "w") do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end

class File
  def self.my_open(filename, mode)
    file = self.new(filename, mode)

    return file unless block_given?

    begin
      yield(file)
    ensure
      file.close
    end
  end
end

File.my_open("letter.txt", "w") do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end
