class Answer < ActiveRecord::Base
	attr_accessible :coords

require File.expand_path('config/environment', '.')

belongs_to :region

GEOFACTORY2 = RGeo::Geographic.simple_mercator_factory
    set_rgeo_factory_for_column(:coords, GEOFACTORY2.projection_factory)


def self.loadanswer
	path = File.join(Rails.root, 'lib/tasks/text.txt')
	::File.open(path) do |file|
		file.each do |line|
            point = Answer::GEOFACTORY2.parse_wkt(line.strip)
            Answer.create(:coords => point.projection) if point
        end
    end
end

def self.find_region
    region = Region.where{st_contains(multi, Answer.last.coords)}.first
    puts region



end






end
