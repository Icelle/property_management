require 'spec_helper'

describe User do
  it {should have_valid(:name).when('Icelle Ku')}
end
