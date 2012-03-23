require 'spec_helper'

describe SqueezeAssociations do
  describe 'VERSION' do

    it "is string" do
      SqueezeAssociations::VERSION.should be_a_kind_of(String)
    end

    it "is properly formatted" do
      version_string = SqueezeAssociations::VERSION
      version_string.should match(/^\d\.\d\.\d$/)
    end

  end
end