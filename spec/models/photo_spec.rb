describe Photo do
  it { should belong_to :art }

  it { should have_valid(:art).when(Art.new) }
  it { should_not have_valid(:art).when(nil) }
end
