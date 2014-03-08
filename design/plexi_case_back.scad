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

module roundedRectHole(size, radius) {
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

module power_hole(distance, rot, size) {
	rotate(a = rot, v = [1, 100, 0]) {
		translate([0, distance, 30]) {
			// Power switch is 34mm tall
			cylinder(r = size, h = 34, center = true);
		}
	}
}

// Two of these will be made, like bread on a sammich
difference() {
	roundedRect([70, 115, 20], 5, true);
	// Make the top of the hole shape stick out so that we know the surface is empty
	roundedRectHole([55, 100, 22], 5, true);
	// Do the same but by having the hole shape stick out the bottom
	roundedRectHole([65, 110, 18], 5, true);
	// Power switch has an 8mm radius (.5 for threading)
	power_hole(42, 90, 8.5);
	// Manual override has 6mm radius (.5 for threading)
	power_hole(-42, 90, 6.5);
}