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
| Lake or River | R color | RGB color |
| ------------- | ------- | --------- |
| _Z. aquatica_ | red3 | (205,0,0) |
| Bass Lake | red | (255,0,0) |
| Clearwater River | orange | (255,165,0) |
| Dahler Lake | yellow3 | (205,205,0) |
| Decker Lake | yellow | (255,255,0)|
| Garfield Lake | green3 | (0,205,0) |
| Mud Hen Lake | green | (0,255,0) |
| Necktie River | blue4 | (0,0,139) |
| Ottertail River | blue | (0,0,255) |
| Phantom Lake | violetred3 | (205,50,120) |
| Lake Plantagenet | violet | (238,130,238) |
| Shell Lake | purple4 | (85,26,139) |
| Upper Rice Lake | purple | (160,32,240) |
