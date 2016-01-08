require 'rails_helper'

describe Photo do
  it { should belong_to :art }

  it { should have_valid(:art).when(Art.new) }
  it { should_not have_valid(:art).when(nil) }

  it { should have_valid(:name).when("mural1.jpg", "mural2.png") }
  it { should_not have_valid(:name).when(nil, "") }
end
