include <../units.scad>

module _OpenBeam_1515_Segment() {
    polygon([[0, 0], [0, 2.35*mm], [0.66*mm, 2.35*mm], [0.78*mm, 2.41*mm],
             [0.83*mm, 2.53*mm], [0.83*mm, 2.64*mm], [0.88*mm, 2.76*mm],
             [0.98*mm, 2.91*mm], [1.19*mm, 3.01*mm], [2.55*mm, 3.33*mm],
             [2.78*mm, 3.45*mm], [2.85*mm, 3.60*mm], [2.90*mm, 3.74*mm],
             [2.90*mm, 5.93*mm], [2.87*mm, 6.00*mm], [2.81*mm, 6.07*mm],
             [2.74*mm, 6.10*mm], [2.05*mm, 6.10*mm], [1.89*mm, 6.15*mm],
             [1.75*mm, 6.23*mm], [1.66*mm, 6.36*mm], [1.60*mm, 6.54*mm],
             [1.60*mm, 7.00*mm], [1.63*mm, 7.18*mm], [1.71*mm, 7.31*mm],
             [1.85*mm, 7.43*mm], [2.06*mm, 7.50*mm], [3.94*mm, 7.50*mm],
             [4.10*mm, 7.46*mm], [4.25*mm, 7.35*mm], [4.35*mm, 7.20*mm],
             [4.40*mm, 7.05*mm], [4.40*mm, 6.62*mm], [4.46*mm, 6.42*mm],
             [4.59*mm, 6.27*mm], [4.78*mm, 6.17*mm], [4.94*mm, 6.15*mm],
             [5.26*mm, 6.29*mm], [6.35*mm, 7.38*mm], [6.48*mm, 7.46*mm],
             [6.63*mm, 7.50*mm], [7.06*mm, 7.50*mm], [7.25*mm, 7.43*mm],
             [7.38*mm, 7.32*mm]]);
}

module OpenBeam_1515(l=1*m)
{
    linear_extrude(height=l) difference() {
        for(rotation = [0:90:270])
        {
            rotate([0, 0, rotation]) {
                _OpenBeam_1515_Segment();
                mirror([1,-1,0]) _OpenBeam_1515_Segment();
            }
        }
        circle(d=2.60*mm, $fn=36);
    }
}
