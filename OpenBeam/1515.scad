include <../units.scad>

module point(xyz)
{
    translate(xyz) circle(epsilon);
}

module angle_slice(r, angle)
{
    R = 1.5*r;
    intersection()
    {
        circle(r);
        polygon(concat([[0,0]],
                        [for(a=[0:angle/4:angle]) [R*cos(a), R*sin(a)]]));
    }
}

// Create a radius on a corner
// r     -- radius of object
// angle -- angle of rotation to extend radius (default = 90)
// 
// This function creates a 2D object that represents space to be differenced
// in order to round the corners of an object.  The radius starts relative to
// the X axis at start_angle degrees counter-clockwise, and ends at end_angle.
// The radius is centered at the origin.

module radius(r, angle=90) 
{
    intersection()
    {
        difference()
        {
            circle(2*r);
            circle(r);
        }
        angle_slice(2*r, angle);
    }
}

module OpenBeam_M3_Tslot()
{
    for(i = [0,1]) mirror([0,i,0])
    {
        translate([2.1*mm,7*mm,0]) rotate(90) radius(0.5*mm);
        translate([1.6*mm,7.5*mm,0]) mirror([0,1,0]) rotate(90, [0,0,1])
            square([1.4*mm,1.6*mm]);
        translate([2.1*mm,6.6*mm,0]) rotate(180) radius(0.5*mm);
        hull()
        {
            translate([2.7*mm,6.1*mm,0]) rotate(180) square(1*mm);
            translate([2.7*mm,5.9*mm,0]) circle(0.2*mm);
            translate([2.4*mm,3.8*mm,0]) circle(0.5*mm);
            translate([0.97*mm,2.97*mm,0]) rotate(90) square(0.97*mm);
            translate([0,6.1*mm,0]) rotate(-90) square(1*mm);
        }
        translate([1.03*mm,2.78*mm,0]) rotate(102.63) radius(0.2*mm, 77.37);
        hull()
        {
            translate([0.83*mm,2.77*mm,0]) rotate(90) square(0.83*mm);
            translate([0.63*mm,2.55*mm,0]) circle(r=0.2*mm);
            translate([0,2.35*mm,0]) square(0.5*mm);
        }
    }
}

module OpenBeam_1515_faces()
{
    for(i = [0,1]) mirror([0,i,0])
    {
        translate([6.645*mm, 7*mm, 0]) rotate(90) radius(0.5*mm, 45);
        hull()
        {
            translate([6.30*mm,7.36*mm,0]) mirror([0,1,0]) rotate(135)
                square(1*mm);
            translate([4.9*mm, 6.67*mm,0]) circle(0.5*mm);
            translate([4.4*mm, 7.5*mm,0]) square(1*mm);
        }
        translate([3.9*mm,7*mm,0]) radius(0.5*mm);
    }
}

module OpenBeam_1515(l)
{
    $fn = $fn < 8 ? 8 : $fn;
    linear_extrude(height=l) {
        difference() {
            square(15*mm, center=true);

            // Center hole
            circle(r=1.25*mm);
            
            for(angle = [0, 90, 180, 270])
            {
                rotate(angle)
                {
                    // Rounded corners
                    translate([7.25*mm,7.25*mm,0]) radius(0.25*mm);

                    OpenBeam_M3_Tslot();
                    OpenBeam_1515_faces();
                }
            }
        }
    }
}
