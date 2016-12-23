require "rails_helper"
require 'net/http'

describe "Homes API" do
  it "should return a homes array" do
    VCR.use_cassette('sample_1') do
      response = Net::HTTP.get_response(URI('http://localhost:3000/api/v1/homes/index'))
      expect(JSON.parse(response.body)).to eq({"message"=> "test"})
    end
  end

  it "vcr" do
    VCR.use_cassette('sample') do
      get "/api/v1/homes/info"
    end
  end
end

