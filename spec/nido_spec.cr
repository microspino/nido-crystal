require "./spec_helper"

describe Nido do
  it "returns the namespace" do
    n1 = Nido.new("foo")
    n1.to_s.should eq "foo"
  end
  
  it "prepends the namespace" do
    n1 = Nido.new("foo")
    n1["bar"].to_s.should eq "foo:bar"
  end
  
  it "works in more than one level" do
    n1 = Nido.new("foo")
    n2 = Nido.new(n1["bar"])
    n2["baz"].to_s.should eq "foo:bar:baz"
  end

  it "is chainable" do
    n1 = Nido.new("foo")
    n1["bar"]["baz"].to_s.should eq "foo:bar:baz"
  end
  
  it "accept numbers" do
    n1 = Nido.new("foo")
    n1[3].to_s.should eq "foo:3"
  end
  
  it "accept symbols" do
    n1 = Nido.new(:foo)
    n1[:bar].to_s.should eq "foo:bar"
  end
end
