% Game of Life.
% len is the argument coresponding for dimenstions of the "field" & start is 2d matrics which contain indexes in which should have ones.
% eg. Example:
% start = [3,3;3,4;2,3;3,6];
% len = 6;
% gol(len, start)

function gol (len, start)
	world = zeros(len,len);	
	n = size(start);
	for index = 1:n(1)
		world(start(index,1),start(index,2)) = 1;
	end
	world
	flag = 1;
	while(flag)
		prev = world;
		for index1 = 1:len
			for index2 = 1:len
				ns_status = 0

				if index1 - 1 >= 1 
					protc1 = index1 - 1;
				else 
					protc1 = -1;
				end
				if index1 + 1 <= len 
					protc2 = index1 + 1;
				else 
					protc2 = -1; 
				end
				if index2 - 1 >= 1 
					protc3 = index2 - 1;
				else 
					protc3 = -1;
				end
				if index2 + 1 <= len 
					protc4 = index2 + 1;
				else 
					protc4 = -1;
				end

				if protc1 != -1
					ns_status += world(protc1,index2);
					if protc3 != -1
						ns_status += world(protc1, protc3);
					end
					if protc4 != -1
						ns_status += world(protc1, protc4);
					end
				end

				if protc2 != -1
					ns_status += world(protc2,index2);
					if protc3 != -1
						ns_status += world(protc2, protc3);
					end
					if protc4 != -1
						ns_status += world(protc2, protc4);
					end
				end

				if protc3 != -1
					ns_status += world(index1, protc3);
				end

				if protc4 != -1
					ns_status += world(index1, protc4);
				end

				if world(index1, index2) == 1
					if ns_status < 2 || ns_status > 3
						world(index1, index2) = 0
					end
				else
					if ns_status == 3
						world(index1, index2) = 1
					end
				end
				imagesc(world)
				pause(0.1);
			end
		end
		if all(all(prev == world)) 
			flag = 0; 
		end 
	end
	world
end

