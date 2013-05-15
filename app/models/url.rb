require 'securerandom'

class Url < ActiveRecord::Base
  validates :url, :short_url, :uniqueness => true
  validates :url, :format => { :with => /http:\/\/.*..{2,3}/, :message => "Please enter a valid email of the format: http://website.com!"}
  validates :url, :presence => true
  before_validation :add_short_url
  before_validation :fetch_url

  def add_short_url
    self.short_url ||= "/nate.ly/" + SecureRandom.hex(3)
  end

  def fetch_url
    @actual_url = self.url.scan(/w+{3}.\w*.\w{2,3}/)[0]
    @http_url = "http://"+ @actual_url
    self.url = @http_url
  end
end