require 'rails_helper'

describe Review do
  it { should belong_to :art }
  it { should belong_to :user }

  it { should have_valid(:body).when("Sweet mural!!!") }
  it { should_not have_valid(:body).when(nil, "") }

  it { should have_valid(:rating).when(5) }
  it { should_not have_valid(:rating).when(nil, "") }

end
