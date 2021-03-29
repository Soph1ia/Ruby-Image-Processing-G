require "functions_framework"
require "json"

# This function receives an HTTP request of type Rack::Request
# and interprets the body as JSON. It prints the contents of
# the "message" field, or "Hello World!" if there isn't one.
FunctionsFramework.http "hello_world" do |request|
  input = JSON.parse request.body.read rescue {}
  msg = input["message"].to_s

  return output.to_s
end

class Rotate_Image

  def rotate
    image = ChunkyPNG::Image.from_file('image.jpg')
    resized_image = image.resize(1024,1000)
    return resized_image
  end
end