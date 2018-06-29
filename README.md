# Rack City

### Lets explore Rack!
Running this as an exploration into Rack and what drives some of the magic in Rails!
Hope to follow up with a web entry / blog documenting the steps. Until then, I will write the steps in a readme as I make them!

## Rack
##### *this will be the bare-bones branch*
``` bundle init ``` this adds a gemfile, and add your rack gem request there
``` ruby
 gem 'rack'
```
From here run your ```bundle``` command and make your application, or checkout the bare-application branch and mess around.

## Basic App
##### *this will be the bare-application branch*
```touch rack_app.rb```

``` ruby
require 'rack'

class RackApp
  def call(env)
    # gather and display basic http items
    request = Rack::Request.new(env) # get that request object
    status = 200 # set the status
    headers = {} # object for headers

    # make a response object
    response = {"verb" => request.request_method, "params" => request.params}
    response_body = ["Heres the request:\n #{response}"]

    #  return the response
    [status, headers, response_body]
  end
end
# Run Rack, with WEBrick on port 9292
Rack::Handler::WEBrick.run(RackApp.new, Port:9292)
```
Adding this makes things happen, now fire it up with a ```ruby rack_app.rb``.
visit localhost:9292 and add params