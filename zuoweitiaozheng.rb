# => http://www.programfan.com/acm/show.asp?qid=111
# => 这个脚本计算座位最佳调整方案
class Staff
	def initialize(id, list)
		@id = id
		#@list = {100, 75, 50}
		@list = list
	end

	def id
		@id
	end
	def list
		@list
	end
end

def tuihuo(staff1, staff2, zone)
	result = []
	staff1.list.each_with_index do |staf1, zone|
		result << (staff2.list[zone] - staf1)
	end
	(zone-1).times{result.shift} if zone > 1
	if staff1.list[zone]-staff2.list[zone] < result.max
		return staff2
	else
		return staff1
	end
end

@staff1 = Staff.new(1, [100,75, 25])
@staff2 = Staff.new(2, [25,75, 100])
@staff3 = Staff.new(3, [100,75, 25])
@staff4 = Staff.new(4, [75,100, 25])
@staff5 = Staff.new(5, [100,75, 25])

zones = [[1,2],[2,2],[3,1]]
zone_list = []


@pool = [@staff1, @staff2, @staff3, @staff5, @staff4]
zones.each do |zone|
	temp2 = []
	zone_no, zone_size = zone[0], zone[1]
	zone_size.times do |item|
		temp_max = nil
		@pool.each do |sta|
			if temp_max.nil?
				temp_max = sta
			else
				temp_max = tuihuo(temp_max, sta, zone_no-1)
			end
		end
		temp2 << temp_max
		@pool.delete(temp_max)

	end
	p temp2
	# p list_temp
	# list_temp[0...zone_size].each{|x| @pool.delete(x[1])}
	zone_list << temp2
	temp2 = nil
end
score = 0
zone_list.each_with_index do |zone, index|
	zone.each do |staff|
		score += staff.list[index]
	end
end
p "The Best Scores is:----#{score}" #=>475