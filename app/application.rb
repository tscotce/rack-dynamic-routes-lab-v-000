class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item.name}, #{item.price}\n"
      end
    elsif req.path.match(/items/)
      !@@items.contains? 
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
