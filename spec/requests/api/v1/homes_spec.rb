require "rails_helper"

describe "Homes API" do
  it "should return a homes array" do
    get "/api/v1/homes/index"
    expect(message: "test")
  end

  it "vcr" do
    VCR.use_cassette('sample') do
      get "/api/v1/homes/info"
    end
  end
end

