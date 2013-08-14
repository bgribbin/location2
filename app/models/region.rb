class Region < ActiveRecord::Base
attr_accessible :poly, :name, :multi

has_many :answers

  GEOFACTORY = RGeo::Geographic.simple_mercator_factory
    set_rgeo_factory_for_column(:poly, GEOFACTORY.projection_factory)

 
def self.load
	
    path = File.join(Rails.root, 'lib/tasks/uk/districts')
    factory = GEOFACTORY
	RGeo::Shapefile::Reader::open(path, :factory => factory) do |file|
		file.each do |record|
			name = record['NAME']
			region = Region.where(:name => name).first ||
			 record.geometry.projection.each do |poly|
			 Region.create(:name => name, :poly => poly)
                
			end
		end
	end
end

def self.look
	
    path = File.join(Rails.root, 'lib/tasks/uk/uk')
	factory = Region::GEOFACTORY
	RGeo::Shapefile::Reader::open(path) do |file|
		file.each do |record|
			puts record['NAME']
			puts record.attributes.inspect
			
		end
	end
end




end
