class SubmissionsController < ApplicationController
                                            # CREATE
                                            # New
                                            # make a get request to 'submissions/new'

        get '/submissions/new' do
            # binding.pry
            require_user_login
            erb :'/submissions/new'
        end
        
                                            # Create
                                            # make a post request to '/submissions'
        post '/submissions' do
            submission = Submission.new(params)
            # binding.pry
            submission.user_id = current_user.id #use similar logic for comment
            if !submission.title.empty? && !submission.story.empty?
                submission.save
                redirect '/submissions'
            else
                # add why they errored aka say invalid error method
                @errors = submission.errors.full_message
                erb :'/submissions/new'
            end
        end

                                            # READ  
                                            # INDEX
                                            # make a get request to '/submissions'

        get '/submissions' do
            @submissions = Submission.all.reverse
            erb :'/submissions/index'
        end

                                            # SHOW
                                            # make a get request to '/submissions/:id' (dynamic route) 
        get '/submissions/:id' do
            @submission = Submission.find_by(id: params[:id])
                    # @comments = @submission.comments.includes(:user) 
            if @submission
                erb :'/submissions/show'
            else
                redirect '/submissions'
            end
        end

                                            # UPDATE
                                            # Edit
                                            # make a get request to '/submissions/:id/edit'
        get '/submissions/:id/edit' do
            if logged_in?
                @submission = Submission.find(params[:id])
                erb :'/submissions/edit'
            end
        end
                                            # Update
                                            # make a patch request to '/submissions/:id'
        patch '/submissions/:id' do
            submission = Submission.find(params[:id])
            if !params["submission"]["title"].empty? && !params["submission"]["story"].empty?
                submission.update(params["submission"])
                redirect "/submissions/#{params[:id]}"
            else
                # add why they errored aka say invalid error method
                @error = "Missing title or story. Please fill out again."
                erb :'/submissions/edit'
            end
        end

                                            # DESTROY (don't really need a get request for this... prob just going to be a form in create or read)
                                            # Delete
                                        # make a delete request to '/submissions/:id'
        delete '/submissions/:id' do
            if logged_in?
                @submission = Submission.find(params[:id])
                if @submission && @submission.user == current_user
                    @submission.destroy
                end
                redirect '/submissions'
            end
        end


        def index
            @submission = Submission.all.includes(:comments)
          end
end
