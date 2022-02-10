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
| Lake or River | R color | RGB color | HEX color | Result |
| ------------- | ------- | --------- | --------- | ------ |
| _Z. aquatica_ | red3 | (205,0,0) | #cd0000| ![ #cd0000](https://via.placeholder.com/15/cd0000/000000?text=+) |
| Bass Lake | red | (255,0,0) | #ff0000 | ![#ff0000](https://via.placeholder.com/15/ff0000/000000?text=+) |
| Clearwater River | orange | (255,165,0) | #ffa600 | ![#ffa600](https://via.placeholder.com/15/ffa600/000000?text=+) |
| Dahler Lake | yellow3 | (205,205,0) | #cdcd00 | ![#ffa600](https://via.placeholder.com/15/ffa600/000000?text=+) |
| Decker Lake | yellow | (255,255,0)| #ffff00 | ![#ffff00](https://via.placeholder.com/15/ffff00/000000?text=+) |
| Garfield Lake | green3 | (0,205,0) | #00cd00 | ![#00cd00](https://via.placeholder.com/15/00cd00/000000?text=+) |
| Mud Hen Lake | green | (0,255,0) | #00ff00 | ![#00ff00](https://via.placeholder.com/15/00ff00/000000?text=+) |
| Necktie River | blue4 | (0,0,139) | #00008b | ![#00008b](https://via.placeholder.com/15/00008b/000000?text=+) |
| Ottertail River | blue | (0,0,255) | #0000ff | ![#0000ff](https://via.placeholder.com/15/0000ff/000000?text=+) |
| Phantom Lake | violetred3 | (205,50,120) | #cd3278 | ![#cd3278](https://via.placeholder.com/15/cd3278/000000?text=+) |
| Lake Plantagenet | violet | (238,130,238) | #ee82ee | ![#ee82ee](https://via.placeholder.com/15/ee82ee/000000?text=+) |
| Shell Lake | purple4 | (85,26,139) | #541a8b | ![#541a8b](https://via.placeholder.com/15/541a8b/000000?text=+) |
| Upper Rice Lake | purple | (160,32,240) | #a020f0 | ![#a020f0](https://via.placeholder.com/15/a020f0/000000?text=+) |

Something to pay attention to: You may not be able to simply enter the RGB values into a function and expect it to work. For example, the `rgb()` function in R requries the RGB values to be given as fractions rather than a series of 3 numbers. Instead, you need to give the RGB values as fractions of values. Since the maximum value for the amount of red, green, and blue in any given color is 255, you must simply use the values you found above and add 255 as the denominator.

```R
rgb(205/255, 0/255, 0/255)
```

**How did I get the colored boxes to appear in the table above?**
I used the following code! (Only the first color, red3, is shown.
```md
![ #cd0000](https://via.placeholder.com/15/cd0000/000000?text=+)
```
