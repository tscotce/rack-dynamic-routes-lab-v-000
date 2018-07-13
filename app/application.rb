class Application

  @@items = []
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if @@items.include?(item) 
        @@items.each do |item|
          resp.write "#{item.name}, #{item.price}\n"
        end
      else 
        resp.write "Item not found\n"
        resp.status = 400
      end
    # elsif req.path.match(/items/)
    #   item = req.path.split("/items/").last
    #   if !@@items.include?(item) 
    #     resp.write "Item not found\n"
    #     resp.status = 400
    # end
    else
      resp.write "Route not found\n"
      resp.status = 404
    end
    resp.finish
  end

end
