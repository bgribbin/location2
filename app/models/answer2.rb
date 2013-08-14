class Answer2 < ActiveRecord::Base
attr_accessible :coords

require File.expand_path('config/environment', '.')

belongs_to :region

def self.loadanswer
	path = File.join(Rails.root, 'lib/tasks/text.txt')
	::File.open(path) do |file|
		file.each do |line|
            point = Region::GEOFACTORY.parse_wkt(line.strip)
            Answer2.create(:coords => point.projection) if point
        end
    end
end

def self.find_region
    region = Region.where{ST_Contains(poly, Answer2.first.coords)}.first
    puts region



end
end
