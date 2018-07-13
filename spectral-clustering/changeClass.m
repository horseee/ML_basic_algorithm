function  res = changeClass(gnd, res)

[ind_1, val] = find(gnd == 4);
[ind_2, val] = find(gnd == 9);
[ind_3, val] = find(gnd == 13);
[ind_4, val] = find(gnd == 21);
[ind_5, val] = find(gnd == 26);
gnd_value = [4, 9, 13, 21, 26];

for i= 1:5
    [spe, val] = find(res == i);
    max_union = 0;
    max_j = 0;
    if size(intersect(spe, ind_1), 1) > max_union
        max_union = size(intersect(spe, ind_1), 1);
    	max_j = 1;
    end
    if size(intersect(spe, ind_2), 1) > max_union
        max_union = size(intersect(spe, ind_2), 1);
    	max_j = 2;
    end
    if size(intersect(spe, ind_3), 1) > max_union
        max_union = size(intersect(spe, ind_3), 1);
    	max_j = 3;
    end
    if size(intersect(spe, ind_4), 1) > max_union
        max_union = size(intersect(spe, ind_4), 1);
    	max_j = 4;
    end
    if size(intersect(spe, ind_5), 1) > max_union
        max_union = size(intersect(spe, ind_5), 1);
    	max_j = 5;
    end
    res(spe) = gnd_value(max_j);
end