class Sitemap < ActiveRecord::Base
	require 'httparty'

	class Sitemap
	  include HTTParty

	  def initialize(sitemap_url = "http://refitme.com/sitemap.xml")
	    @sitemap_url = sitemap_url
	    @google_ping_url = "http://www.google.com/webmasters/sitemaps/ping"
	  end

	  def ping
	    puts "Ping Google with: #{@sitemap_url}"
	    self.class.get @google_ping_url, query: { sitemap: @sitemap_url }
	  end
	end
end
