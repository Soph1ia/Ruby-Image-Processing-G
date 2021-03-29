require "functions_framework"
require "json"
require "chunky_png"
require "benchmark"

# This function receives an HTTP request of type Rack::Request
# and interprets the body as JSON. It prints the contents of
# the "message" field, or "Hello World!" if there isn't one.
FunctionsFramework.http "hello_world" do |request|
  input = JSON.parse request.body.read rescue {}
  msg = input["message"].to_s
  util = Image_Benchmarking.new
  output = util.run
  return output.to_s
end

class Image_Benchmarking

  def run
    puts Benchmark.measure {
      50.times do
        image = Rotate_Image.new
        image.resize
      end
    }
    return " Image resized 50 times successfully"

  end

end

class Rotate_Image

  def resize
    image = ChunkyPNG::Image.from_file('image.png')
    resized_image = image.resize(1024, 1000)
    return resized_image
  end
end
