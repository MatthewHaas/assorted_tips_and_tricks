# Assorted tips and tricks


## Directory
1. [Converting named R colors to RGB (red, green, blue) values](#-Converting-named-R-colors-to-RGB-values)

## Converting named R colors to RGB values
If you want to figure out the RGB (red, green, blue) value of a named R color such as those found [here](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf) or through the `colors()` R function (works in RStudio), you can use the `col2rgb()` function. For example, I used this function so that I could perfectly re-create the colors from the PCA plot in the genetic diversity project to make the map of Northern Wild Rice (NWR) collection sites map in Python.<br>
**Input:**
```R
col2rgb("red3")
```
**Output:**
```R
      [,1]
red    205
green    0
blue     0
```
You'll want to use this because the color "red3" is specific to R, but an RGB value of (205,0,0) will work in any computing language.

**Complete results:**<br>
| Lake or River | R color | RGB color | HEX color |
| ------------- | ------- | --------- | --------- |
| _Z. aquatica_ | red3 | (205,0,0) | #cd0000|
| Bass Lake | red | (255,0,0) | #ff0000 |
| Clearwater River | orange | (255,165,0) | #ffa600 |
| Dahler Lake | yellow3 | (205,205,0) | #cdcd00 |
| Decker Lake | yellow | (255,255,0)| #ffff00 |
| Garfield Lake | green3 | (0,205,0) | #00cd00 |
| Mud Hen Lake | green | (0,255,0) | #00ff00 |
| Necktie River | blue4 | (0,0,139) | #00008b |
| Ottertail River | blue | (0,0,255) | #0000ff |
| Phantom Lake | violetred3 | (205,50,120) | #cd3278 |
| Lake Plantagenet | violet | (238,130,238) | #ee82ee |
| Shell Lake | purple4 | (85,26,139) | #541a8b |
| Upper Rice Lake | purple | (160,32,240) | #a020f0 |
