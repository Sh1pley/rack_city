require 'rack'

class RackApp
  def call(env)
    # gather and display basic http items
    request = Rack::Request.new(env) # get that request object
    status = 200 # set the status
    headers = {} # object for headers
    # make a response object
    response = {
                        "URL" => request.base_url,
                        "path" => request.fullpath,
                        "verb" => request.request_method,
                        "params" => request.params
                      }
    response_body = ["Heres the request:\n #{response}"]

    #  return the response
    [status, headers, response_body]
  end
end
# Run Rack, with WEBrick on port 9292
Rack::Handler::WEBrick.run(RackApp.new, Port:9292)