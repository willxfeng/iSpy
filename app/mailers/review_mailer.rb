class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    
    mail(
      to: review.art.user.email,
      subject: "New review for #{review.art.name}"
    )
  end
end
