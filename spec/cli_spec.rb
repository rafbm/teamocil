require File.join(File.dirname(__FILE__), "spec_helper.rb")

describe Teamocil::CLI do

  context "executing" do

    before do # {{{
      @fake_env = { "TMUX" => 1, "HOME" => File.join(File.dirname(__FILE__), "fixtures") }
    end # }}}

    it "creates a layout" do # {{{
      @cli = Teamocil::CLI.new(["sample"], @fake_env)
      @cli.layout.session.name.should == "sample"
      @cli.layout.session.windows.length.should == 2
      @cli.layout.session.windows.first.name.should == "foo"
      @cli.layout.session.windows.last.name.should == "bar"
    end # }}}

    it "lists available layouts" do # {{{
      @cli = Teamocil::CLI.new(["--list"], @fake_env)
      @cli.layouts.should == ["sample", "sample-2"]
    end # }}}

  end

end
