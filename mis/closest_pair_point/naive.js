var points = require ('./Point')
function closestPair () {
	// generate the points, :: array
	const LOW = -1000;
	const HI = 1000;
	const SIZE = 300;
	const plane = points.generate(LOW, HI, SIZE);
	
	var cp = new Set();
	var min_distance = -1;
	for (var i = 0; i < SIZE; i++) {
		for (var j = 0; j < SIZE; j++) {
			if ( i == j ) {
				// skip the duplicate points
				continue; 
			}
			if ( cp.size == 0 ) {
				cp.add (plane[i]);
				cp.add (plane[j]);
				min_distance = points.Point.distance (plane[i], plane[j]);
			}
			else {
				distance = points.Point.distance (plane[i], plane[j]);
				if (distance < min_distance) {
					cp.clear();
					cp.add (plane[i]);
                                	cp.add (plane[j]);
					min_distance = points.Point.distance (plane[i], plane[j]);
				}
			}
		}
	}
	return [min_distance, cp] 
}



console.log (closestPair())
