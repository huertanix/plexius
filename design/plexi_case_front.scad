module roundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	
	hull() {
	  // place 4 circles in the corners, with the given radius
	  translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
	  circle(r=radius);
	
	  translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
	  circle(r=radius);
	
	  translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
	  circle(r=radius);
	
	  translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
	  circle(r=radius);
	}
}

module minkowskiRect(size, radius, center) {
	x = size[0];
	y = size[1];
	z = size[2];

	minkowski() {
		cube([x-5,y-5,z], center);
		cylinder(r=radius,h=z, center);
	}
}

module button_hole(distance, rot, size) {
	rotate(a = rot, v = [1, 100, 0]) {
		translate([0, distance, 30]) {
			// Power switch is 34mm tall
			cylinder(r = size, h = 34);
		}
	}
}

module front_box() {
	union() {
		minkowskiRect([70, 125, 20], 5, true);

		// Create the 10mm long inner lip (no idea wtf to call anything not a mecha engineer)
		// translate is being totally ignored
		translate(5,5,10) {
			minkowskiRect([65, 120, 30], 5, true);
		}
	}
}

// Two of these will be made, like bread on a sammich
difference() {
	front_box();
	// Make the top of the hole shape stick out so that we know the surface is empty
	minkowskiRect([55, 110, 22], 5, true); //inner hole (smaller void)
	// Do the same but by having the hole shape stick out the bottom
	translate(0,0,30) {
		minkowskiRect([60, 115, 18], 5, true); //outer hole (larger void) that makes the lip happen
	}
	// Power switch has an 8mm radius
	button_hole(42, 90, 8);
	// 6mm radius for manual override aka shutter release
	button_hole(-42, 90, 6);
}
