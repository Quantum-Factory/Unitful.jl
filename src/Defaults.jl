# Default dimensions and their abbreviations.
# The dimension symbols are generated by tab completion: \mbfL is 𝐋, etc.
# This is kind of a compromise on polluting the namespace.
@dimension 𝐋 "𝐋" Length
@dimension 𝐌 "𝐌" Mass
@dimension 𝐓 "𝐓" Time
@dimension 𝐈 "𝐈" Current
@dimension 𝚯 "𝚯" Temperature    # This one is \mbfTheta
@dimension 𝐍 "𝐍" Amount
@dimension 𝐉 "𝐉" Luminosity
@dimension ∠ "∠" Angle          # This one is just \angle

# Define derived dimensions.
@derived_dimension Area       𝐋^2
@derived_dimension Volume     𝐋^3
@derived_dimension Frequency  𝐓^-1

# Define base units. This is not to imply g is the base SI unit instead of kg.
# See the documentation for further details.
# #key:   Symbol  Display  Name      Dimension
@refunit  m       "m"      Meter     𝐋
@refunit  s       "s"      Second    𝐓
@refunit  A       "A"      Ampere    𝐈
@refunit  K       "K"      Kelvin    𝚯
@refunit  cd      "cd"     Candela   𝐉
@refunit  mol     "mol"    Mole      𝐍
@refunit  g       "g"      Gram      𝐌
@refunit  rad     "rad"    Radian    ∠

# These lines allow for μ to be typed with option-m on a Mac.
# The character encodings are different here so this is less crazy than it looks
const  µm = μm
export µm

# Length
#key: Symbol Display    Name        Equivalent to           10^n prefixes?
@unit mi     "mi"       Mile        (201168//125)*m         false
@unit yd     "yd"       Yard        (9144//10000)*m         false
@unit ft     "ft"       Foot        (3048//10000)*m         false
@unit inch   "in"       Inch        (254//10000)*m          false

# Area
@unit ac     "ac"       Acre        (316160658//78125)*m^2  false
@unit a      "a"        Are         100m^2                  false

# The hectare is used more frequently than any other power-of-ten of an are.
const  ha = Unitful.Units{(Unitful.Unit{:Are}(2,1//1),)}()
export ha

# Time
@unit minute "min"      Minute      60s                     false
@unit h      "hr"       Hour        3600s                   false
@unit d      "dy"       Day         86400s                  false
@unit wk     "wk"       Week        604800s                 false

# Angle
@unit °       "°"       Degree      (pi/180)*rad           false
import Base: sin, cos, tan, cot, sec, csc
for y in [:sin, :cos, :tan, :cot, :sec, :csc]
    @eval ($y){T,D}(x::Quantity{T,D,typeof(°)}) = ($y)(x.val*pi/180)
    @eval ($y){T,D}(x::Quantity{T,D,typeof(rad)}) = ($y)(x.val)
end

# Temperature
@unit °Ra    "°Ra"      Rankine     (5//9)*K                false
@unit °C     "°C"       Celsius     1K                      false
Unitful.offsettemp(::Unitful.Unit{:Celsius}) = 27315//100
@unit °F     "°F"       Fahrenheit  (5//9)*K                false
Unitful.offsettemp(::Unitful.Unit{:Fahrenheit}) = 45967//100

# SI and related units
@unit N      "N"        Newton      1kg*m/s^2               true    # GRAM problem
@unit Pa     "Pa"       Pascal      1N/m^2                  true
@unit J      "J"        Joule       1N*m                    true
@unit W      "W"        Watt        1J/s                    true
@unit eV     "eV"       eV          1.6021766208e-19*J      true    # CODATA 2014
@unit C      "C"        Coulomb     1A*s                    true
@unit V      "V"        Volt        1W/A                    true
@unit Ω      "Ω"        Ohm         1V/A                    true
@unit S      "S"        Siemens     1/Ω                     true
@unit F      "F"        Farad       1s^4*A^2/(kg*m^2)       true
@unit H      "H"        Henry       1J/(A^2)                true
@unit T      "T"        Tesla       1kg/(A*s^2)             true
@unit Wb     "Wb"       Weber       1kg*m^2/(A*s^2)         true

# Constants
const  k = 1.38064852e-23*(J/K)  # 2014 CODATA value
export k
