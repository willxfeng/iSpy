class VotesController < ApplicationController
  def create
    new_vote = params[:new_vote]
    r_id = params[:r_id].to_i

    vote = Vote.find_by(user: current_user, review_id: r_id)

    if vote
      if vote.upvote == (new_vote == 'upvote')
        vote.destroy()
      else
        vote.upvote = !vote.upvote
        vote.save
      end
    else
      Vote.create(user: current_user,
        review_id: r_id,
        upvote: new_vote=='upvote')
    end

    render json: {
      upvotes: Vote.where(review_id: r_id, upvote: true).count,
      downvotes: Vote.where(review_id: r_id, upvote: false).count
    }
  end
end
