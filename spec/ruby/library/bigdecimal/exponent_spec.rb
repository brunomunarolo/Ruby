require_relative '../../spec_helper'

ruby_version_is ""..."3.4" do
  require_relative 'shared/power'
  require 'bigdecimal'

  describe "BigDecimal#**" do
    it_behaves_like :bigdecimal_power, :**
  end

  describe "BigDecimal#exponent" do

    it "returns an Integer" do
      BigDecimal("2E100000000").exponent.kind_of?(Integer).should == true
      BigDecimal("2E-999").exponent.kind_of?(Integer).should == true
    end

    it "is n if number can be represented as 0.xxx*10**n" do
      BigDecimal("2E1000").exponent.should == 1001
      BigDecimal("1234567E10").exponent.should == 17
    end

    it "returns 0 if self is 0" do
      BigDecimal("0").exponent.should == 0
      BigDecimal("+0").exponent.should == 0
      BigDecimal("-0").exponent.should == 0
    end

  end
end
