require "dotenv"
require "net/http"
require "uri"

Dotenv.load(File.join(__dir__, ".env"))

fail "Place session COOKIE in .env file" if ENV.fetch("COOKIE", "").empty?

# This will get the basename of the current directory for which this file
# is being required.
year = File.basename(Dir.getwd)
day = $0.sub(/\.rb\z/, "")
puts "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
puts "┃ Advent of Code - Year #{year} - Day #{day} ┃"
puts "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"

# Create the input directory if it doesn't exist
input_directory = File.join(Dir.getwd, "input")
Dir.mkdir(input_directory) unless Dir.exist?(input_directory)

# Fetch the input data from the Advent of Code website
unless File.exist?(File.join(input_directory, "#{day}.txt"))
  uri = URI.parse("https://adventofcode.com/#{year}/day/#{day.sub(/^0/, "")}/input")
  request = Net::HTTP::Get.new(uri)
  request["Cookie"] = "session=#{ENV["COOKIE"]}"
  request["Accept"] = "text/plain,text/html"
  request["User-Agent"] = "omegahm's script"
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
    http.request(request)
  end

  fail "Failed to fetch input data: #{response.code} #{response.message}" unless response.code.to_i == 200

  input_file_path = File.join(input_directory, "#{day}.txt")
  File.write(input_file_path, response.body)
end

# Load the input data
@input = File.read(File.join(input_directory, "#{day}.txt"))

# Show results
def print_result(part, result)
  size = result.size

  puts "┏#{"━" * [size + 2, 37].max}┓"
  puts "┃ Part #{part} #{" " * [size - 7, 28].max} ┃"
  puts "┣#{"━" * [size + 2, 37].max}┫"
  puts "┃ #{result.to_s.rjust(35)} ┃"
  puts "┗#{"━" * [size + 2, 37].max}┛"
end

def print_part1(result) = print_result(1, result)
def print_part2(result) = print_result(2, result)
