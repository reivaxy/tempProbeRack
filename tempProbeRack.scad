

sideOffset = 15;
count = 4;
dist = 51;
largeDiam = 5;

x = 30;
y = 2 * sideOffset + ((count - 1) * dist);
z = 3;
topOffset = 10;
supportX = 4;
supportZ = 23;

rack();

module rack() {
  difference() {
    support();
    translate([0, sideOffset, 0 ])
      trous();

  }
  
}

module trous() {
  for(i = [0: count - 1]) {
    translate([topOffset -1, i * dist - largeDiam/2, supportZ - largeDiam - 3 ])
      trou();
  }

}

module trou() {
  translate([0, largeDiam/2, largeDiam/2])
    rotate(90, [0, 1, 0])
      cylinder(d=largeDiam, h=supportX + 2, $fn= 80);
}
  
module support() {  
  cube([x, y, z]);
  translate([topOffset, 0, 0])
    cube([supportX, y, supportZ]);
  translate([topOffset - supportX, 0, z])
    roundedInside(supportX, y);
  translate([topOffset + 2*supportX, y, z])
    rotate(180, [0, 0, 1])
      roundedInside(supportX, y);
}


module roundedInside(side, length) {
  difference() {
    cube([side, length, side]);
    translate([0, -1, side])
      rotate(-90, [1, 0, 0])
        cylinder(d=side*2, h=length + 2, $fn=80);
  }
  
}