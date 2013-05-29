# -*- encoding: utf-8 -*-

require "spec_helper"

describe DioTests::Client do
  def stub_file(format)
    open("./spec/stubs/#{format}.txt").read
  end

  describe "#print_test_count" do
    subject{ dio.print_test_count }

    where(:format, :expected_plus_count, :expected_minus_count) do
      [
        ["rspec" , 1 , 0],
        ["junit4", 33, 0],
        ["qunit" , 1 , 0],
      ]
    end

    with_them do
      before do
        dio.stub!(:git_log).and_return(stub_file(format))
        subject
      end

      let(:dio) { DioTests::Client.new(:format => format) }

      it{ expect(dio.plus_count).to  eq expected_plus_count }
      it{ expect(dio.minus_count).to eq expected_minus_count }
    end
  end

  describe "#format_pattern" do
    subject{ DioTests::Client.format_pattern(fotmat) }

    let(:fotmat){ "junit4" }

    it{ should == "@(Test|Theory)" }
  end

end

