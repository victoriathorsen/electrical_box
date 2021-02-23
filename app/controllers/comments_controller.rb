class CommentsController < ApplicationController

    get '/submissions/:submission_id/comments' do 
        require_user_login
        # erb :'submissions/show'
    end

    post '/submissions/:submission_id/comments' do
        comment = Comment.new(params)
        comment.user_id = current_user.id
        comment.submission_id = current_submission.id
                        # @comment = Comment.new(params[:comment].permit(:username, :comment)
            
        if !comment.comment.empty? 
            comment.save
            redirect '/submissions/:submission_id'
        else
            @error = "Missing title or comment. Please fill out again."
            redirect '/submissions/:submission_id'
        end
    end

    get '/submissions/:submission_id/comments/:comment_id' do
        @comment = Comment.all.reverse
        erb :'/submissions/index'
    end
  
    # delete '/comments/:id'
    delete '/submissions/comments/:id' do
        # @submission = Submission.find(params[:submission_id])
        @comment = Comment.find(params[:id])
        if @comment && @comment.user == current_user
            @comment.destroy
        end
        redirect '/submissions/:submission_id'
    end
end




# class CommentsController < ApplicationController

#     def create
#       # First get the parent post:
#         @post = Post.find(params[:post_id])
  
#       # Then build the associated model through the parent (this will give it the correct post_id)
#         @comment = @post.comments.build(comment_params)
  
#       # Assign the user directly
#         @comment.user = current_user
#         @comment.submission_id = @submission.id

#         if @comment.save
#             redirect_to '/submission/:id'
#         else
#             render :new
#         end
#     end

#     def show
#         @comment = Comment.find(params[:id])
#      end

#     def comment_params
#         params.require(:comment).permit(:text, :username)
#      end


#   end