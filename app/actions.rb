# Homepage (Root path)
get '/' do
  erb :index
end

get "/tracks" do
  @tracks = Track.get_by_upvotes
  erb :"tracks/index"
end

get "/tracks/new" do
  @track = Track.new
  erb :"tracks/new"
end

post "/tracks" do
  @track = Track.new(params)

  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get "/users/login" do
  @user = User.new
  erb :"users/login"
end

post "/users/login" do
  if @user= User.find_by_username(params[:username]).try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect "/users/profile"
  else
    @failed = true
    erb :"/users/login"
  end
end

get "/users/new" do
  erb :"users/new"
end

post "/users/new" do
  @user=User.new(params)

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect "users/profile"
  else
    @errormessage = @user.errors.messages
    erb :"users/new"
  end
end

get "/users/profile" do
  if session[:user_id]
    @user=User.find(session[:user_id])
    @user_tracks = @user.tracks
    erb :"users/profile"
  else
    redirect "users/login"
  end
end

post "/logout" do
  temp = request.path_info
  session.delete(:user_id)
  redirect back
end

post "/upvote" do
  @upvote=Upvote.new(params)
  if @upvote.save
    redirect "/tracks"
  else
    @failure = @upvote.errors.messages
    erb :"/tracks"
  end
end