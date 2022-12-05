Rails.application.routes.draw do
get("/", { :controller => "application", :action => "track_list" })
get("/track", { :controller => "application", :action => "index" })
end
