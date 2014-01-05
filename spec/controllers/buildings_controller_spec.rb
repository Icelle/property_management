#     get "/buildings/new"
#     expect(response).to render_template(:new)

#     post "/buildings", :building => {:street => "1160 Hanover Street"}

#     expect(response).to redirect_to(assigns(:building))
#     follow_redirect!

#     expect(response).to render_template(:show)
#     expect(response.body).to include("Building was successfully created.")
#   end
# end
