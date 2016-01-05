require 'rails_helper'
describe Art do
  it { should have_valid(:name).when("Nice Mural", "Broadway St. Tag")}
  it { should_not have_valid(:name).when(nil, "")}

  it { should have_valid(:location).when("Park St.", "Phoenix, AZ")}
  it { should_not have_valid(:location).when(nil, "")}

  it { should have_valid(:description).when("Wow that's really nice")}
  it { should_not have_valid(:description).when(nil, "")}

  it { should have_valid(:category).when("Mural", "Graffiti")}
  it { should_not have_valid(:category).when(nil, "")}
end
