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

module front_box() {
	union() {
		roundedRect([70, 125, 20], 5, true);
		
		// Create the 10mm inner lip (no idea wtf to call anything not a mecha engineer)		
		translate(0,0,-10) { // translate is being totally ignored, lip appearing on the top instead of bottom
			roundedRect([65, 120, 28], 5, true); // not moving downward
			//cylinder (h = 40, r = 9, center = true); // wtf this can go negative but the rectangle can't
		}
	}
}

// Two of these will be made, like bread on a sammich
difference() {
	front_box();
	// Make the top of the hole shape stick out so that we know the surface is empty
	roundedRectHole([55, 110, 22], 5, true); //inner hole (smaller void)
	// Do the same but by having the hole shape stick out the bottom
	translate(0,0,-5) {
		roundedRectHole([60, 115, 18], 5, true); //outer hole (larger void) that makes the front edge happen
	}
	// Power switch has an 8mm radius
	power_hole(-42, 90, 8);
	// Same for manual override
	//power_hole(42, 90, 8);
}