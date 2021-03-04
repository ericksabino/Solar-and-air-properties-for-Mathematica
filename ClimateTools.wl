(* ::Package:: *)

BeginPackage["ClimateTools`"]


airViscosity::usage="airViscosity[x] gives the air kinematic viscosity [Units in Pa*s] calculated from power law   |   x is equal to the temperature in Kelvins";


airThermalConductivity::usage="airThermalConductivity[x] gives the air Thermal Conductivity [Units in W/(m*K)] calculated from Kannuluik, WG and Carman, EH's equations  |   x is equal to the temperature in Kelvins";


airDensity::usage="airDensity[x,y,z] gives the air density [Units in kg/m\.b3] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins, y is atmospheric pressure and z the relative humidity";


airHeatSpecificCapacity::usage="airHeatSpecificCapacity[x] gives the air Heat Specific Capacity [Units in J/(kg*K)] calculated from Asano-Mass Transfer   |   x is equal to the temperature in Kelvins";


airRelativeHumidity::usage="airRelativeHumidity[x,y] gives the air Heat Specific Capacity [Units in %] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins and y the dew point in Kelvins";


Begin["`Private`"]


airViscosity[x_]= 1.729*10^-5*(x/273)^0.7;


airThermalConductivity[x_]=(5.75*10^-5(1+0.00317*(x-273)-0.0000021*(x-273)^2))*418.4;


airDensity[x_,y_,z_] = (1.32352  Exp^((17.3 (-273 + x))/(-35.7 + x)) z)/x + (0.00348362 (y - 610.8 Exp^((17.3 (-273 + x))/(-35.7 + x)) z))/x;


airHeatSpecificCapacity[x_]=(28.11 + 1.97*x*10^-3 + 4.8*10^-6*x^2 - 1.97*10^-9*x^3)/(28.97/1000);


airRelativeHumidity[x_,y_] =100*(610.8*Exp[(17.3*(y-273)/(237.3+y-273))])/(610.8*Exp[(17.3*(x-273)/(237.3+x-273))]);


End[ ]


EndPackage[ ]
