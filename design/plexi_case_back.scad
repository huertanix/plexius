module roundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	
	hull() {
	  // place 4 circles in the corners, with the given radius
	  //translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
	  //circle(r=radius);

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

module wifi_hole() {
	translate([-8,-70,0]) {
		cube(size=[16,20,11]);
	}
}

module usb_hole() {
	translate([-6,34,0]) {
		cube(size=[12,20,10]);
	}
}

// each 
module usb_inner_hole() {
	translate([-4,50,0]) {
		cube(size=[8,20,8]);
	}
}

// Two of these will be made, like bread on a sammich
difference() {
	// 18mm high
	roundedRect([65, 105, 18], 5, true);
	// Make the top of the hole shape stick out so that we know the surface is empty
	roundedRectHole([50, 90, 20], 5, true);
	// Do the same but by having the hole shape stick out the bottom 1mm lip
	roundedRectHole([60, 100, 17], 5, true);
	// Power switch has an 8mm radius (.5 for threading)
	power_hole(40, 90, 8.5);
	// Manual override has 6mm radius (.5 for threading)
	power_hole(-40, 90, 6.5);
	wifi_hole();
	usb_hole();
	usb_inner_hole();
}