# Assorted tips and tricks


## Directory
1. [Making scripts reusable](#Making-scripts-reusable)
2. [Converting named R colors to RGB values](#Converting-named-R-colors-to-RGB-values)
3. [Counting the number of SNPs in a VCF file](#Counting-SNPs-in-a-VCF-file)
4. [Search and replace in `vim`](#Search-and-replace-in-vim)

## Making scripts reusable
You may often find yourself needing to re-create figured from an analysis with parameters slightly altered or using a different dataset (or a subset of the original). When you first conduct an analysis, you might hard-code input and output files in your script. This is fine, but can become cumbersome if you need to constantly change names in the file. The good news is that you can write the code once and re-use it as many timeas as you like without editing the script!

**In R:**<br>
The following line should appear somewhere near the top of your R script (right after you import the required packages for example).
```R
args = commandArgs(trailingOnly = TRUE)
```
Then, wherever you would normally have a filename in your script, you can replace them with `args[1]`, `args[2]`, and so on. I prefer to use them sequentially in the script. Then, in your shell (.sh) script, you would simply have one line that calls the R script that you want to use and the filenames you would like to be inserted into R script:
```bash
Rscript scriptname.R filename1 filename2
```

**In Python:**<br>
You will need the following lines at the top of your python script (along with other modules you will be importing)
```python
import os
import sys
```
The placeholder for the filename is similar to R, but slightly different: `sys.argv[1]`, `sys.argv[2]`, etc. You would feed the filenames into the python exactly the same way that you would feed them into R because both are done using shell scripting.
```bash
python scriptname.py filename1 filename2
```


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
I used the following code! (Only the first color, red3, is shown. To get a different color, you'd need to replace the HEX color code in both places where it occurs in the code below.)
```md
![ #cd0000](https://via.placeholder.com/15/cd0000/000000?text=+)
```

## Counting SNPs in a VCF file
Simply replace `input.vcf` with the name of your VCF file. This method works by counting the number of lines in a VCF file excluding the header lines.
```bash
grep -v "^#" input.vcf | wc -l
```

## Search and replace in `vim`
If you want to do a quick search and replace in the `vim` editor, you can quickly accomplish your goals with a few quick keystrokes.

The pattern is something like this:
```bash
%s/text-you-want-to-replace/text-you-want-to-replace-it-with/g
```

For example, if I have a text file that looks like this:
```bash
Sample_0001/Sample_0001_sorted.bam
Sample_0002/Sample_0002_sorted.bam
Sample_0003/Sample_0003_sorted.bam
Sample_0004/Sample_0004_sorted.bam
Sample_0005/Sample_0005_sorted.bam
...
```
and I want to strip everything from the forward slash to the end of the line, I can rapidly accomplish that with one line of code:
```bash
%s/\/.*$//g
```
Notice how I used _regular expressions_ here. I will break this down character by character.
1. The backslash (`\`) in the fourth position indicates that the forward slash following it should be interpreted literally.
2. The period (`.`) is a wildcard that matches any character.
3. The asterisk (`*`) indicates that the _preceding element_ should be matched zero or more times.
4. The dollar symbol (`$`) indicates the end of the line

Putting all of this together, any strings (patterns) that start with a forward slash (`/`) will be removed from the occurrence of the forward slash to the end of the line. This is also because we left the "text-you-want-to-replace-it-with" blank. You are replacing the defined string with a blank/empty string. Pretty simple/cool, right?

If you are successful, your file should now look like this:
```bash
Sample_0001
Sample_0002
Sample_0003
Sample_0004
Sample_0005
...
```
