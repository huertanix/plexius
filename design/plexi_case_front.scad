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

module semiRoundedRect(size, radius){
  x = size[0];
  y = size[1];
  z = size[2];

  linear_extrude(height=z)
	
  hull() {
    // place 4 circles in the corners, with the given radius
    translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
    square([radius*2,radius*2], center=true);
	
    translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    circle(r=radius);
	
    translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    circle(r=radius);
	
    translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    square([radius*2,radius*2], center=true);
  }
}

module button_hole(distance, rot, size) {
	rotate(a = rot, v = [0, 100, 0]) {
		translate([-20, distance, -40]) {
			// Power switch is 34mm tall
			union() {
				cylinder(r = size, h = 34);
				translate([-size*2,-size,0]) {
					cube(size = [size*2, size*2,34]);
				}
			}
		}
	}
}

module wifi_hole() {
	translate([-8,50,25]) {
		cube(size=[16,20,5]);
	}
}

module front_box() {
	union() {
		semiRoundedRect([70, 115, 20], 5, true);
		// Create the 10mm long inner lip (no idea wtf to call anything not a mecha engineer)
		roundedRect([65, 110, 30], 5, true);
	}
}

// Two of these will be made, like bread on a sammich
difference() {
	difference() {
		front_box();
		// Make the top of the hole shape stick out so that we know the surface is empty
		roundedRect([55, 100, 32], 5, true); //inner hole (smaller void)
		// Power switch has an 8mm radius (.5 for threading)
		button_hole(-42, 90, 8.5);
		// 6mm radius for manual override aka shutter release (.5 for threading)
		button_hole(42, 90, 6.5);
		wifi_hole();
	}
	// Do the same but by having the hole shape stick out the top
	translate(v=[0,0,2]) {
		// 65 -2, 120 -2
		roundedRect([63, 108, 30], 5); //outer hole (larger void) that makes the lip happen
	}
}