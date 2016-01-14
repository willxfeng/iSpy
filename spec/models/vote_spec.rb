describe Vote do
  it { should belong_to :review }
  it { should belong_to :user }

  it { should have_valid(:upvote).when(true, false, 1, 0) }
  it { should_not have_valid(:upvote).when(nil, "") }
end
