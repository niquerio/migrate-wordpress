require "faraday"
require "json"
require "byebug"

#Notes
#Need to have permalinks set up
#Need to get an application password from the user's edit profile page

conn = Faraday.new(
  url: 'http://web',
) do |f|
  f.request :json
  f.request :authorization, :basic, 'admin', 'YOUR SPECIAL PASSWORD'
  f.response :json
end

#response = conn.get('/wp-json/wp/v2/pages')
#puts JSON.pretty_generate(JSON.parse(response.body))

string = File.read("grandtourney_2023_rapier.html")

resp = conn.post('/wp-json/wp/v2/pages', {
  "date" => "2023-01-01T23:23:23",
  "slug" => "my-html-page",
  "title" => "My Html Page",
  "content" => string
})
puts resp.status
puts resp.body

