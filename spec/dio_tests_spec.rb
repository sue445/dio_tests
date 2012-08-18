# -*- encoding: utf-8 -*-

require "./dio_tests"

describe DioTests do
  describe "#print_test_count" do
    let(:dio) { sut = DioTests.new }

    context "rspec" do
      before do
        git_log_stub = read_file "./spec/git_log/rspec.txt"
        dio.stub!(:git_log).and_return(git_log_stub)
        dio.print_test_count "^\s+its?"
      end

      it "can get plus_count" do
        dio.plus_count.should == 1
      end

      it "can get minus_count" do
        dio.minus_count.should == 0
      end
    end

    context "junit4" do
      before do
        git_log_stub = read_file "./spec/git_log/junit4.txt"
        dio.stub!(:git_log).and_return(git_log_stub)
        dio.print_test_count "@(Test|Theory)"
      end

      it "can get plus_count" do
        dio.plus_count.should == 33
      end

      it "can get minus_count" do
        dio.minus_count.should == 0
      end
    end

    context "qunit" do
      before do
        git_log_stub = read_file "./spec/git_log/qunit.txt"
        dio.stub!(:git_log).and_return(git_log_stub)
        dio.print_test_count "^\s*test"
      end

      it "can get plus_count" do
        dio.plus_count.should == 1
      end

      it "can get minus_count" do
        dio.minus_count.should == 0
      end
    end
  end

end

def read_file(file_name)
  text = ""
  open(file_name) do |f|
    text = f.read
  end
  text
end
