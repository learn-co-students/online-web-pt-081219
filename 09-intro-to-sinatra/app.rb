require 'sinatra'

class App < Sinatra::Base
  get '/hello/world' do
    build_page_from_body('<h1>Hello, World!</h1>')
  end

  get '/hello/sinatra' do
    build_page_from_body('<h1>Hello, Sinatra!</h1>')
  end

  get '/' do
    body = <<-HTML
<ul>
  <li><a href='/hello/world'>world</a></li>
  <li><a href='/hello/world'>sinatra</a></li>
</ul>
    HTML

    build_page_from_body(body)
  end

  private

  def build_page_from_body(body)
        page = <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <title>Hello Sinatra</title>
  </head>
  <body>
    #{body}
  </body>
</html>
    HTML

  page
  end
end
