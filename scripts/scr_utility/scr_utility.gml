
function print(str1, str2){
		
	show_debug_message(str1)
	if str2 != undefined
		show_debug_message(str2)
}

function xy_to_ij(xx, yy){

	var j = ((yy / (TILE_HEIGHT >> 1)) - (xx / (TILE_WIDTH >> 1))) / 2;
	var i = xx  / (TILE_WIDTH >> 1) + j;
	
	return([round(i), round(j)])
}

function ij_to_xy(i, j){
	var k;
	
	k[1] = (i + j) * (TILE_HEIGHT >> 1)
	k[0] = (i - j) * (TILE_WIDTH >> 1)
	
	return(k)
}

function dir_to_int(dir){
	return(((dir + 22) mod 360) div 45) 
}

function scr_ring(value, _min, _max){
	return value mod (_max + 1)
}

function scr_gcd(a, b){

	var new_a;
	var new_b;

	while (a!=b && a!=0 && b!=0)
	{
	new_a = a mod b;
	new_b = b mod a;
	a = new_a;
	b = new_b;
	}

	return max(a,b);
}

function in_bounds(w, h, i, j){
	return(i >= 0 and i < w and j >= 0 and j < h)
}