var obj = {
	Point: class {
		constructor (px, py) {
			this.x = px;
			this.y = py;
		}
		static distance (p1, p2) {
			return Math.sqrt(
				Math.pow((p2.y - p1.y),2) + 
				Math.pow((p2.x - p1.x),2)
			);
		}
	},
	generate: function (low, hi, size) {		
		if ( Math.abs(low-hi) < size ) {
			console.log ("Size is larger than the boundry");
			process.exit();
		}
		collection = []
		for (var i=0; i < size; i++) {
			collection.push (
				new this.Point (
					Math.floor(Math.random() * hi+2) - Math.abs(low),
					Math.floor(Math.random() * hi+1) - Math.abs(low),
				)
			);
		}
		return collection;
	}
}
//console.log (obj.generate (-1000, 1000, 200))
//var p1 = new obj.Point (0,1)
//var p2 = new obj.Point (0,0)
//console.log (obj.Point.distance(p1,p2))
/*
// Little testing to the code

p1 = new Point (12, 13)
p2 = new Point (14, 15)

collection = []
collection.push (p1)
collection.push (p2)

console.log (collection)
*/


module.exports = obj

