<!-- README.md is generated from README.Rmd. Please edit that file -->
FBRbeta
=======

The FBR method is a highly flexible multi-paramatric method to study fMRI data. This package was developed to handle lag in fMRI data. This method convoles the HRF with boxcars for each stimulus event (also called timing). This package consist of one general function , and minor functions. All minor functions are implemented in this general function.

Example
-------

This is an example for simulated data. However, this package can handle read fMRI data, using the function . Important for this package is that the working directory should be set in the .feat (for FSL) directory.

``` r
library(FBRbeta)
library(MASS)
#Imaging all preprocessed data (obtained via readData("filtered_func_data.nii"))
load("~/Desktop/Rpackage/FBRbeta/data/dat.rda")
dat
#> $data
#> Loading required package: arf3DS4
#> Loading required package: tcltk
#> Loading required package: corpcor
#> 
#> Attaching package: 'arf3DS4'
#> The following object is masked from 'package:stats':
#> 
#>     BIC
#> [    ]
#> 
#> <location>
#> path:             
#> filename:         
#> extension:       nii.gz
#> 
#> <file>
#> filetype:        nifti 
#> size of header:  348 
#> type of data:    16 
#> bits_per_pixel:  32 
#> magic string:    n+1 
#> voxel offset:    0 
#> data.type:       double 
#> signed:          TRUE 
#> 
#> <fmri data>
#> description:     ARF3DS4 
#> intent code:     5 
#> intentname:      estimates 
#> 
#> <dimensions>
#> xyzt units:      xyz in millimeters | time in seconds
#>  
#> pixel dims:      1 1 1 1 1 0 0 0 
#> dimensions:      4 1 1 1 215 0 0 0 
#> q form code:     1 
#> s form code:     1 
#> 
#> 
#> $betas
#>  [1] 582.9628 379.8556 411.1200 605.9035 407.4907 596.2200 665.4570
#>  [8] 424.7252 450.8490 589.6161
#> 
#> $timings
#> An object of class "EV"
#> <S4 Type Object>
#> attr(,"hrf.type")
#> [1] "double.gamma"
#> attr(,"hrf.parameters")
#> attr(,"hrf.parameters")$a1
#> [1] 6
#> 
#> attr(,"hrf.parameters")$a2
#> [1] 12
#> 
#> attr(,"hrf.parameters")$b1
#> [1] 0.9
#> 
#> attr(,"hrf.parameters")$b2
#> [1] 0.9
#> 
#> attr(,"hrf.parameters")$ce
#> [1] 0.35
#> 
#> attr(,"hrf.parameters")$Hz
#> [1] 20
#> 
#> attr(,"include.derivative")
#> [1] FALSE
#> attr(,"confound.matrix")
#> `\001NULL\001`
#> attr(,"convolved.evs")
#> `\001NULL\001`
#> attr(,"ev.names")
#> [1] "data1"
#> attr(,"ev.timings")
#> attr(,"ev.timings")[[1]]
#>       [,1] [,2]     [,3]
#>  [1,]   20    0 582.9628
#>  [2,]   40    0 379.8556
#>  [3,]   60    0 411.1200
#>  [4,]   80    0 605.9035
#>  [5,]  100    0 407.4907
#>  [6,]  120    0 596.2200
#>  [7,]  140    0 665.4570
#>  [8,]  160    0 424.7252
#>  [9,]  180    0 450.8490
#> [10,]  200    0 589.6161
#> 
#> attr(,"ev.trials")
#> [1] 10
#> attr(,"fourD.header")
#> An object of class "nifti.header"
#> Slot "sizeof_hdr":
#> [1] 348
#> 
#> Slot "data_type":
#> [1] ""
#> 
#> Slot "db_name":
#> [1] ""
#> 
#> Slot "extents":
#> [1] 0
#> 
#> Slot "session_error":
#> [1] 0
#> 
#> Slot "regular":
#> [1] "r"
#> 
#> Slot "dim_info":
#> [1] ""
#> 
#> Slot "dims":
#> [1]   3   0   0   0 215   0   0   0
#> 
#> Slot "intent_p1":
#> [1] 0
#> 
#> Slot "intent_p2":
#> [1] 0
#> 
#> Slot "intent_p3":
#> [1] 0
#> 
#> Slot "intent_code":
#> [1] 5
#> 
#> Slot "datatype":
#> [1] 16
#> 
#> Slot "bitpix":
#> [1] 32
#> 
#> Slot "slice_start":
#> [1] 0
#> 
#> Slot "pixdim":
#> [1] 1 1 1 1 1 0 0 0
#> 
#> Slot "vox_offset":
#> [1] 0
#> 
#> Slot "scl_slope":
#> [1] 1
#> 
#> Slot "scl_inter":
#> [1] 0
#> 
#> Slot "slice_end":
#> [1] 0
#> 
#> Slot "slice_code":
#> [1] 0
#> 
#> Slot "xyzt_units":
#> [1] "\n"
#> 
#> Slot "cal_max":
#> [1] 0
#> 
#> Slot "cal_min":
#> [1] 0
#> 
#> Slot "slice_duration":
#> [1] 0
#> 
#> Slot "toffset":
#> [1] 0
#> 
#> Slot "glmax":
#> [1] 0
#> 
#> Slot "glmin":
#> [1] 0
#> 
#> Slot "descrip":
#> [1] "ARF3DS4"
#> 
#> Slot "aux_file":
#> [1] ""
#> 
#> Slot "qform_code":
#> [1] 1
#> 
#> Slot "sform_code":
#> [1] 1
#> 
#> Slot "quatern_b":
#> [1] 0
#> 
#> Slot "quatern_c":
#> [1] 0
#> 
#> Slot "quatern_d":
#> [1] 0
#> 
#> Slot "qoffset_x":
#> [1] 0
#> 
#> Slot "qoffset_y":
#> [1] 0
#> 
#> Slot "qoffset_z":
#> [1] 0
#> 
#> Slot "srow_x":
#> [1] 1 0 0 0
#> 
#> Slot "srow_y":
#> [1] 0 1 0 0
#> 
#> Slot "srow_z":
#> [1] 0 0 1 0
#> 
#> Slot "intent_name":
#> [1] "estimates"
#> 
#> Slot "magic":
#> [1] "n+1"
#> 
#> Slot "data.type":
#> [1] "double"
#> 
#> Slot "data.signed":
#> [1] TRUE
#> 
#> Slot "fullpath":
#> character(0)
#> 
#> Slot "filename":
#> character(0)
#> 
#> Slot "filetype":
#> [1] "nifti"
#> 
#> Slot "extension":
#> [1] "nii"
#> 
#> Slot "gzipped":
#> [1] TRUE
#> 
#> Slot "endian":
#> [1] "little"
#> 
#> Slot "version":
#> Activated Region Fitting version 2.5-10 (rev. 219)
#ROI represents the voxels (or as an example of real data (dat[50, 32, 15,])
ROI = c(9, -3, -7, -9, -7, -5, -9, 2,  7, 13, 20, 9, 4, 2, 7, 7, -2, -3, -5, 0)

# the stimulus presentations are on the following seconds 
##(or real data read.table(file = "custom_timing_files/ev.txt"):
timings = c(2, 6, 8, 10, 12, 14) 

# I want 3 boxes with length 2 
nbox = 3
lenbox = 2

TR = 1

# the desigmatrix for this setup
designmatrix(ROI, timings, nbox, lenbox, TR)
#> $timing1
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    1    0    0    0    0    0
#>  [3,]    1    0    0    0    0    0
#>  [4,]    0    1    0    0    0    0
#>  [5,]    0    1    0    0    0    0
#>  [6,]    0    0    1    1    0    0
#>  [7,]    0    0    1    1    0    0
#>  [8,]    0    0    0    1    1    0
#>  [9,]    0    0    0    1    1    0
#> [10,]    0    0    0    1    1    1
#> [11,]    0    0    0    1    1    1
#> [12,]    0    0    0    1    1    1
#> [13,]    0    0    0    1    1    1
#> [14,]    0    0    0    1    1    1
#> [15,]    0    0    0    1    1    1
#> [16,]    0    0    0    0    1    1
#> [17,]    0    0    0    0    1    1
#> [18,]    0    0    0    0    0    1
#> [19,]    0    0    0    0    0    1
#> [20,]    0    0    0    0    0    0
#> 
#> $timing2
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    0    0    0    1    0    0
#>  [3,]    0    0    0    1    0    0
#>  [4,]    0    0    0    0    1    0
#>  [5,]    0    0    0    0    1    0
#>  [6,]    1    0    0    0    0    1
#>  [7,]    1    0    0    0    0    1
#>  [8,]    0    1    0    1    0    0
#>  [9,]    0    1    0    1    0    0
#> [10,]    0    0    1    1    1    0
#> [11,]    0    0    1    1    1    0
#> [12,]    0    0    0    1    1    1
#> [13,]    0    0    0    1    1    1
#> [14,]    0    0    0    1    1    1
#> [15,]    0    0    0    1    1    1
#> [16,]    0    0    0    0    1    1
#> [17,]    0    0    0    0    1    1
#> [18,]    0    0    0    0    0    1
#> [19,]    0    0    0    0    0    1
#> [20,]    0    0    0    0    0    0
#> 
#> $timing3
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    0    0    0    1    0    0
#>  [3,]    0    0    0    1    0    0
#>  [4,]    0    0    0    0    1    0
#>  [5,]    0    0    0    0    1    0
#>  [6,]    0    0    0    1    0    1
#>  [7,]    0    0    0    1    0    1
#>  [8,]    1    0    0    0    1    0
#>  [9,]    1    0    0    0    1    0
#> [10,]    0    1    0    1    0    1
#> [11,]    0    1    0    1    0    1
#> [12,]    0    0    1    1    1    0
#> [13,]    0    0    1    1    1    0
#> [14,]    0    0    0    1    1    1
#> [15,]    0    0    0    1    1    1
#> [16,]    0    0    0    0    1    1
#> [17,]    0    0    0    0    1    1
#> [18,]    0    0    0    0    0    1
#> [19,]    0    0    0    0    0    1
#> [20,]    0    0    0    0    0    0
#> 
#> $timing4
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    0    0    0    1    0    0
#>  [3,]    0    0    0    1    0    0
#>  [4,]    0    0    0    0    1    0
#>  [5,]    0    0    0    0    1    0
#>  [6,]    0    0    0    1    0    1
#>  [7,]    0    0    0    1    0    1
#>  [8,]    0    0    0    1    1    0
#>  [9,]    0    0    0    1    1    0
#> [10,]    1    0    0    0    1    1
#> [11,]    1    0    0    0    1    1
#> [12,]    0    1    0    1    0    1
#> [13,]    0    1    0    1    0    1
#> [14,]    0    0    1    1    1    0
#> [15,]    0    0    1    1    1    0
#> [16,]    0    0    0    0    1    1
#> [17,]    0    0    0    0    1    1
#> [18,]    0    0    0    0    0    1
#> [19,]    0    0    0    0    0    1
#> [20,]    0    0    0    0    0    0
#> 
#> $timing5
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    0    0    0    1    0    0
#>  [3,]    0    0    0    1    0    0
#>  [4,]    0    0    0    0    1    0
#>  [5,]    0    0    0    0    1    0
#>  [6,]    0    0    0    1    0    1
#>  [7,]    0    0    0    1    0    1
#>  [8,]    0    0    0    1    1    0
#>  [9,]    0    0    0    1    1    0
#> [10,]    0    0    0    1    1    1
#> [11,]    0    0    0    1    1    1
#> [12,]    1    0    0    0    1    1
#> [13,]    1    0    0    0    1    1
#> [14,]    0    1    0    1    0    1
#> [15,]    0    1    0    1    0    1
#> [16,]    0    0    1    0    1    0
#> [17,]    0    0    1    0    1    0
#> [18,]    0    0    0    0    0    1
#> [19,]    0    0    0    0    0    1
#> [20,]    0    0    0    0    0    0
#> 
#> $timing6
#>       [,1] [,2] [,3] [,4] [,5] [,6]
#>  [1,]    0    0    0    0    0    0
#>  [2,]    0    0    0    1    0    0
#>  [3,]    0    0    0    1    0    0
#>  [4,]    0    0    0    0    1    0
#>  [5,]    0    0    0    0    1    0
#>  [6,]    0    0    0    1    0    1
#>  [7,]    0    0    0    1    0    1
#>  [8,]    0    0    0    1    1    0
#>  [9,]    0    0    0    1    1    0
#> [10,]    0    0    0    1    1    1
#> [11,]    0    0    0    1    1    1
#> [12,]    0    0    0    1    1    1
#> [13,]    0    0    0    1    1    1
#> [14,]    1    0    0    0    1    1
#> [15,]    1    0    0    0    1    1
#> [16,]    0    1    0    0    0    1
#> [17,]    0    1    0    0    0    1
#> [18,]    0    0    1    0    0    0
#> [19,]    0    0    1    0    0    0
#> [20,]    0    0    0    0    0    0
boxtimings <- designmatrix(ROI, timings, nbox, lenbox, TR)

# I want to maximum (or summation) for all beta-values for these designmatrices.
fbrbetafunc(dat, boxtimings, ROI, timings, nbox, lenbox, TR, maximum = T )
#>           [,1]
#> [1,] -5.000000
#> [2,] 16.769231
#> [3,] 19.125000
#> [4,] 17.850000
#> [5,]  4.125000
#> [6,] -2.384615
```
# FBRbeta
