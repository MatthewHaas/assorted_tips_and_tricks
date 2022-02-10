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
