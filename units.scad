// units.scad
// Copyright (C) 2015 Chris Arnold
// 
// This file contains definitions for a unit system within OpenSCAD.  The
// default is 1 unit per mm, but that may be changed by changing the value of
// _units_per_meter to something other than 1000.

_units_per_meter = 1000;
epsilon = 0.001;

// Metric units
meter = _units_per_meter;
yoctometer = 1e-24*meter;
zeptometer = 1e-21*meter;
attometer  = 1e-18*meter;
femtometer = 1e-15*meter;
picometer  = 1e-12*meter;
nanomiter  = 1e-9*meter;
micrometer = 1e-6*meter;
millimeter = 1e-3*meter;
centimeter = 1e-2*meter;
decimeter  = 1e-1*meter;
decameter  = 1e1*meter;
hectometer = 1e2*meter;
kilometer  = 1e3*meter;
megameter  = 1e6*meter;
gigameter  = 1e9*meter;
terameter  = 1e12*meter;
petameter  = 1e15*meter;
exameter   = 1e18*meter;
zettameter = 1e21*meter;
yottameter = 1e24*meter;

ym  = yoctometer;
zm  = zeptometer;
am  = attometer;
fm  = femtometer;
pm  = picometer;
nm  = nanometer;
um  = micrometer;
mm  = millimeter;
cm  = centimeter;
dm  = decimeter;
m   = meter;
dam = decameter;
hm  = hectometer;
km  = kilometer;
Mm  = megameter;
Gm  = gigameter;
Tm  = terameter;
Pm  = petameter;
Em  = exameter;
Zm  = zettameter;
Ym  = yottameter;

micron = micrometer;

// United States customary units
yard = 0.9144*meter;
foot = yard/3;
inch = foot/12;
mile = 1609.344*meter;

yd = yard;
ft = foot;
in = inch;
mi = mile;

mil = 0.001*inch;
