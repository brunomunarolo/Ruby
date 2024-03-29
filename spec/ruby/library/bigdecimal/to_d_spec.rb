require_relative '../../spec_helper'

ruby_version_is ""..."3.4" do
  require 'bigdecimal'
  require 'bigdecimal/util'

  describe "Float#to_d" do
    it "returns appropriate BigDecimal zero for signed zero" do
      -0.0.to_d.sign.should == -1
      0.0.to_d.sign.should == 1
    end
  end
end
