# Solar-and-air-properties-for-Mathematica
This a package to calculate some properties of the air and to do some calculations on solar equipments.
***

## Installing / Getting started
To run this tool you'll need Wolfram Mathematica software installed.
With a project created, you need to put the SolarCalculus.wl file on the storage.
Locate the right folder using this code:

```shell
SystemOpen[FileNameJoin[{$UserBaseDirectory, "Applications"}]]
```

After that, create a folder called SolarCalculus and put the SolarCalculus.wl in it. After that, import the package with the following code:

```shell
Needs["SolarCalculus`"]
```
That's all. Now you are able to use functions of this package.

## Functions

#### airViscosity
>airViscosity[x] gives the air kinematic viscosity [Units in Pa*s] calculated from power law   |   x is equal to the temperature in Kelvins
>

#### airThermalConductivity
>airThermalConductivity[x] gives the air Thermal Conductivity [Units in W/(m*K)] calculated from Kannuluik, WG and Carman, EH's equations  |   x is equal to the temperature in Kelvins
>

#### airDensity
>airDensity[x,y,z] gives the air density [Units in kg/m³] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins, y is atmospheric pressure and z the relative humidity
>

#### airHeatSpecificCapacity
>airHeatSpecificCapacity[x] gives the air Heat Specific Capacity [Units in J/(kg*K)] calculated from Asano-Mass Transfer   |   x is equal to the temperature in Kelvins
>

#### airRelativeHumidity
>airRelativeHumidity[x,y] gives the air Heat Specific Capacity [Units in %] calculated from Tetens Equation   |   x is equal to the temperature in Kelvins and y the dew point in Kelvins 
>

#### solarHourAngle
>solarHourAngle[x] calculates the angle value from a given hour | x is the hour from 0 to 23
>

#### equationOfTime
>solarHourAngle[x] calculates the angle value from a given hour | x is the hour from 0 to 23
>

#### equationOfTime
>equationOfTime[x] calculates the equation of time in a given day number
>
#### solarHourAngleCorrectedByLongitude
>Corrects the hour according to longitude   | use as follows [hour,longitude_,GMT, day number]
>
#### solarDeclination
>Corrects the hour according to number's day on the year  | use as follows [day number]
>
#### solarAltitude
>calculate the solar altitude according to the hour   | use as follows [latitude,day number,hour,longitude,GMT]
>
#### radnormalextra
>Estimates the normal extraterrestrial solar radiation   | use as follows [day number]
>
#### radhorextra
>Estimates the horizontal extraterrestrial solar radiation   | use as follows [latitude,day number,hora,longitude,GMT]
>
#### clearnessIndex
>Estimates the relation between global solar radiation and extraterrestrial solar radiation  | use as follows [radglobhorizontal_,day number]
>
#### erbsCorrelation
>Calculates the Erbs correlation based on clearness index  | use as follows [radglobhorizontal,day number]
>
#### diffuseSolarRadiation
>Calculates the fraction of diffuse solar radiation  | use as follows [radglobhorizontal,day number]
>
#### directSolarRadiation
>Calculates the fraction of direct solar radiation  | use as follows [radglobhorizontal,day number]
>
#### cosθLatNoth
>Calculates cosθ for North Latitudes | use as follows [day number,hora,GMT,latitude,longitude,inclination]
>
#### cosθz
>Calculates cosθz for North Latitudes | use as follows [day number,hora,GMT,latitude,longitude,inclination]
>
#### rbFactor
>Calculates the RB Factor (cosθ/cosθz) | use as follows [day number,hora,GMT,latitude,longitude,inclination]
>
#### solarRadiationOnInclinedSurfaceLatNorth
>Calculates the solar radiation on a inclined surface for Latitude North and Azimute 0 or 180 | use as follows [radglobhorizontal_,day number_,hora_,GMT_,latitude_,longitude_,inclination_,al_]
>

## Example
![alt text](https://github.com/ericksabino/Solar-calculations-and-air-properties-for-Mathematica/blob/main/example.JPG "Logo Title Text 1")

