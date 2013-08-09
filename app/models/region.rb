class Region < ActiveRecord::Base
attr_accessible :poly, :name, :multi

has_many :answers

  GEOFACTORY = RGeo::Geographic.simple_mercator_factory
    set_rgeo_factory_for_column(:multi, GEOFACTORY.projection_factory)

 
def self.load
	
    path = File.join(Rails.root, 'lib/tasks/uk/county_region')
	factory = Region::GEOFACTORY
	RGeo::Shapefile::Reader::open(path, :factory => factory) do |file|
		file.each do |record|
			name = record['NAME']
			region = Region.where(:name => name).first ||
			 Region.create(:name => name, :multi => record.geometry.projection)
                
			
		end
	end
end





end
