class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    # @review.user = user
    # review_user = @review.user
    user = @review.art.user
    mail(
      to: user.email,
      subject: "New review for #{review.art.name}"
    )
  end
end
