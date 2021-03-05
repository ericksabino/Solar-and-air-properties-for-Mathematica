(* ::Package:: *)

BeginPackage["SolarCalculus`"]


airViscosity::usage="airViscosity[x] gives the air kinematic viscosity [Units in Pa*s] calculated from power law   |   x is equal to the temperature in Kelvins";


airThermalConductivity::usage="airThermalConductivity[x] gives the air Thermal Conductivity [Units in W/(m*K)] calculated from Kannuluik, WG and Carman, EH's equations  |   x is equal to the temperature in Kelvins";


airDensity::usage="airDensity[x,y,z] gives the air density [Units in kg/m\.b3] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins, y is atmospheric pressure and z the relative humidity";


airHeatSpecificCapacity::usage="airHeatSpecificCapacity[x] gives the air Heat Specific Capacity [Units in J/(kg*K)] calculated from Asano-Mass Transfer   |   x is equal to the temperature in Kelvins";


airRelativeHumidity::usage="airRelativeHumidity[x,y] gives the air Heat Specific Capacity [Units in %] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins and y the dew point in Kelvins";


solarHourAngle::usage="solarHourAngle[x] calculates the angle value from a given hour";


equationOfTime::usage="equationOfTime[x] calculates the equation of time in a given day of year";


solarHourAngleCorrectedByLongitude::usage="Corrects the hour according to longitude   | use as follows [hour,longitude_,GMT, sequencial day's number since 01-jan]";


solarDeclination::usage="Corrects the hour according to number's day   | use as follows [sequencial day's number since 01-jan]";


solarAltitude::usage="calculate the solar altitude according to the hour   | use as follows [latitude,day's number,hour,longitude,GMT]";


radnormalextra::usage="Estimates the normal extraterrestrial solar radiation   | use as follows [sequencial day's number since 01-jan]";


radhorextra::usage="Estimates the horizontal extraterrestrial solar radiation   | use as follows [latitude,dian,hora,longitude,GMT]";


clearnessIndex::usage="Estimates the relation between global solar radiation and extraterrestrial solar radiation  | use as follows [radglobhorizontal_,day's number]";


erbsCorrelation::usage="Calculates the Erbs correlation based on clearness index  | use as follows [radglobhorizontal,day's number]";


diffuseSolarRadiation::usage="Calculates the fraction of diffuse solar radiation  | use as follows [radglobhorizontal,day's number]";


directSolarRadiation::usage="Calculates the fraction of direct solar radiation  | use as follows [radglobhorizontal,day's number]";


cos\[Theta]LatNoth::usage="Calculates cos\[Theta] for North Latitudes | use as follows [dian,hora,gmt1,latitude,longitude,inclination]";


cos\[Theta]z::usage="Calculates cos\[Theta]z for North Latitudes | use as follows [dian,hora,gmt1,latitude,longitude,inclination]";


rbFactor::usage="Calculates the RB Factor (cos\[Theta]/cos\[Theta]z) | use as follows [dian,hora,gmt1,latitude,longitude,inclination]";


solarRadiationOnInclinedSurfaceLatNorth::usage="Calculates the solar radiation on a inclined surface for Latitude North and Azimute 0 or 180 | use as follows [radglobhorizontal_,dian_,hora_,gmt1_,latitude_,longitude_,inclination_,al_]";


Begin["`Private`"]


airViscosity[x_]= 1.729*10^-5*(x/273)^0.7;


airThermalConductivity[x_]=(5.75*10^-5(1+0.00317*(x-273)-0.0000021*(x-273)^2))*418.4;


airDensity[x_,y_,z_] = (1.32352  Exp^((17.3 (-273 + x))/(-35.7 + x)) z)/x + (0.00348362 (y - 610.8 Exp^((17.3 (-273 + x))/(-35.7 + x)) z))/x;


airHeatSpecificCapacity[x_]=(28.11 + 1.97*x*10^-3 + 4.8*10^-6*x^2 - 1.97*10^-9*x^3)/(28.97/1000);


airRelativeHumidity[x_,y_] =100*(610.8*Exp[(17.3*(y-273)/(237.3+y-273))])/(610.8*Exp[(17.3*(x-273)/(237.3+x-273))]);


solarHourAngle[hora_]=(12-hora)*-15;


equationOfTime[dian_]=9.87Sin[Pi/180*2*(dian-81)*360/364]-1.5Sin[Pi/180*(dian-81)*360/364] - 7.53 Cos[Pi/180*(dian-81)*360/364];


solarHourAngleCorrectedByLongitude[hora_,longitude_,gmt1_,dian_]=(60*hora+equationOfTime[dian]+4(gmt1*15+longitude))/60;


solarDeclination[dian_]=23.45Sin[(284+dian)360/365*Pi/180];


solarAltitude[latitude_,dian_,hora_,longitude_,gmt_]=ArcSin[Cos[Pi/180*latitude]*Cos[Pi/180*solarDeclination[dian]]*Cos[Pi/180*(solarHourAngle[solarHourAngleCorrectedByLongitude[hora,longitude,gmt,dian]])]+Sin[Pi/180*latitude]*Sin[Pi/180*solarDeclination[dian]]]*180/Pi;


radnormalextra[dian_]=1367*(1+0.033*Cos[Pi/180*360*dian/365]);


radhorextra[latitude_,dian_,hora_,longitude_,gmt_]=1367*(1+0.033*Cos[Pi/180*0.0172024*dian])*Sin[solarAltitude[latitude,dian,hora,longitude,gmt]*Pi/180]; 


clearnessIndex[radglobhorizontal_,dian_]=radglobhorizontal/radnormalextra[dian];


erbsCorrelation[radglobhorizontal_,dian_]=If[clearnessIndex[radglobhorizontal,dian]>0.8,0.165,
If[clearnessIndex[radglobhorizontal,dian]<=0.22,1-0.09*clearnessIndex[radglobhorizontal,dian],
0.9511-0.1604*clearnessIndex[radglobhorizontal,dian]+ 4.388*clearnessIndex[radglobhorizontal,dian]^2 -16.638*clearnessIndex[radglobhorizontal,dian]^3+ 12.336*clearnessIndex[radglobhorizontal,dian]^4]];


diffuseSolarRadiation[radglobhorizontal_,dian_]=erbsCorrelation[radglobhorizontal,dian]*radglobhorizontal;


directSolarRadiation[radglobhorizontal_,dian_]=radglobhorizontal - erbsCorrelation[radglobhorizontal,dian]*radglobhorizontal;


cos\[Theta]LatNoth[dian_,hora_,gmt1_,latitude_,longitude_,inclination_]=Cos[Pi/180*(latitude-inclination)]*Cos[Pi/180*solarDeclination[dian]]*Cos[Pi/180*solarHourAngle[solarHourAngleCorrectedByLongitude[hora,longitude,gmt1,dian]]]+ Sin[Pi/180*(latitude-inclination)]*Sin[Pi/180*solarDeclination[dian]];


cos\[Theta]z[dian_,hora_,gmt1_,latitude_,longitude_]=Cos[Pi/180*(latitude)]*Cos[Pi/180*solarDeclination[dian]]*Cos[Pi/180*solarHourAngle[solarHourAngleCorrectedByLongitude[hora,longitude,gmt1,dian]]]+ Sin[Pi/180*(latitude)]*Sin[Pi/180*solarDeclination[dian]];


rbFactor[dian_,hora_,gmt1_,latitude_,longitude_,inclination_]=cos\[Theta]LatNoth[dian,hora,gmt1,latitude,longitude,inclination]/cos\[Theta]z[dian,hora,gmt1,latitude,longitude];


solarRadiationOnInclinedSurfaceLatNorth[radglobhorizontal_,dian_,hora_,gmt1_,latitude_,longitude_,inclination_,al_]=directSolarRadiation[radglobhorizontal,dian]*rbFactor[dian,hora,gmt1,latitude,longitude,inclination]+diffuseSolarRadiation[radglobhorizontal,dian]/2*(1+Cos[inclination*Pi/180])+radglobhorizontal*al/2*(1-Cos[inclination*Pi/180]);


End[ ]


EndPackage[ ]
