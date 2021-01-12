require 'coveralls'
Coveralls.wear!

require 'test/unit'
require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware-oauth2_refresh'

class OAuth2Test < Test::Unit::TestCase
  def test_setup
    Faraday.new 'http://example.com/api' do |conn|
      conn.request :oauth2_refresh
    end

    ref = FaradayMiddleware::OAuth2Refresh.new

    assert_equal 'FaradayMiddleware::OAuth2Refresh', ref.class.name
  end
end
