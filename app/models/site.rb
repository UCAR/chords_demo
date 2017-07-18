class Site < ActiveRecord::Base
  has_many :instruments, :dependent => :destroy
  
  def self.initialize
  end
  
  def self.list_site_options 
      Site.select("id, name").map {|site| [site.id, site.name] }
  end  
  
  def self.create_cuahsi_site
  	s = Site.find(1)
	  data = {
      "user" => 'chords',
      "password" => 'chords',
      "SourceID" => 1,
      "SiteName" => s.name,
      "SiteCode" => 1,
      "Latitude" => s.lat,
      "Longitude" => s.lon,
      "SiteType" => "Stream",
      "Elevation_m" => s.elevation
      }
	  return data
	end
  
end
