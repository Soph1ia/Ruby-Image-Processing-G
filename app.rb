require "functions_framework"
require "json"
require 'mini_magick'

# This function receives an HTTP request of type Rack::Request
# and interprets the body as JSON. It prints the contents of
# the "message" field, or "Hello World!" if there isn't one.
FunctionsFramework.http "hello_world" do |request|
  input = JSON.parse request.body.read rescue {}
  util = Image_Benchmarking.new
  output = util.run
  return output.to_s
end

class Image_Benchmarking

  def run
    puts Benchmark.measure {
      # 50.times do
      50.times do
        image = Image_Handler.new
        image.resize
      end
    }
    return " Image resized 50 times successfully"

  end

end

class Image_Handler

  def resize
    image = MiniMagick::Image.open("image.png")
    image.resize "1024x1000"
    return "Image resized"
  end

end
