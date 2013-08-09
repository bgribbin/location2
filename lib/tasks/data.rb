require File.expand_path('config/environment', '.')
require 'rgeo-shapefile'




    GEOFACTORY = RGeo::Geographic.simple_mercator_factory
    path = Rails.root.join('lib/tasks/uk/uk.shp')
	factory = Region::GEOFACTORY
	RGeo::Shapefile::Reader::open(Rails.root.join('lib/tasks/uk/uk.shp')) do |file|
		file.each do |record|
			tzid = record['TZID']
			region = Region.where(:name => tzid).first ||
			 Region.create(:name => tzid)
			record.geometry.projection.each do |polygon|
				region.regions.create(:poly => polygon)
			end
		end
	end
