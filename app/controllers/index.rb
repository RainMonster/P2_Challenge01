get '/' do
  @tasks = Task.order(:id)
  erb :index
end

post '/' do
  @task = Task.create(params[:task])
  @tasks = Task.order(:id)   
  erb :index
end

get '/task/:id' do
  @task = Task.find_by_id(params[:id])
  erb :task_page
end

put '/task/:id' do
  update_task = Task.find_by_id(params[:id])
  params[:task]["complete"] = "true" if params[:task]["complete"] == "on" 
  update_task.update_attributes(params[:task])
  redirect '/'
end

delete '/task/:id' do
  @finished_task = Task.find_by_id(params[:id])
  @finished_task.destroy
  redirect '/'
end

get '/task/:id/confirm_delete' do
  @confirm_task = Task.find_by_id(params[:id])
  erb :confirm_delete
end
