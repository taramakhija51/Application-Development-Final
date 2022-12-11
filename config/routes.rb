Rails.application.routes.draw do
# get("/", { :controller => "application", :action => "track_list" })
get("/", { :controller => "application", :action => "index" })
get("/track_list/", { :controller => "application", :action => "show" })
get("/track_list/:path_id/", { :controller => "application", :action => "details" })
end
