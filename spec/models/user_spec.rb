require 'spec_helper'

describe User do
  it { should have_many(:buildings) }
  #it { should have_many(:owners) }

end
