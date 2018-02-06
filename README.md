<a href="https://imgur.com/HCmheJ3"><img src="https://i.imgur.com/HCmheJ3.png" title="source: imgur.com"/></a>

# Spinning-cylinders-in-a-B-field #

A simulation of a conducting metal cylinder rotating inside of a constant magnetic field, developed initially just to see how the 
magnetic field lines (contours of the B-field) change over time due to the rotation of the cylinder. Some pretty interesting results are 
shown and a lot of mid-depth analysis into the convergence and stability of finite difference methods included.

Code initially developed as a peice of coursework in MATLAB but now extended to incorporate more features such as stablility and
convergence analysis, a shift into Python+Fortran and some better looking plots. 

## Summary of abilities ##
- Solves a system of coupled Partial differential equations in 1-D with Finite difference methods
- Shows the distortion of magnetic field lines via polar contour plots
- Performs numerical analysis on the rate of convergence of solutions and the stability of Finite difference methods
- Demonstrates the use of F2PY for vastly improvign performance of iterative code whilst handling all higher-level problems in Python

## Requirements and Installation ## 

- Matlab 2017a or newer (older versions may work, check their documentation on logical arrays)
  - Simply install Matlab via the Mathworks <a href="https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab">website</a>
  - Fork and clone all the .m files into your MATLAB working directory, or even better, into your Matlab <a href="https://uk.mathworks.com/products/matlab-drive.html?s_tid=MLD_MLDOSI">drive</a>
- Alternatively, you can use <a href="https://uk.mathworks.com/products/matlab-online.html">Matlab online</a> through an internet browser, not ideal but usable.
  - Using Matlab drive is essential in this case

(NOTE: Matlab is not open source, and so to obtain the software you'll need a Mathworks license. For students this is free via your 
institution, otherwise you can always adapt the code slightly and use it in GNU Octave) (see its documentation for more details)

## Usage ##



## Contributing ##

If you'd like to improve on my work or suggest any corrections/fixes to me for something that may not be fully working then please feel 
free to. I'm still learning a lot about computational PDE's!

## Credits ##

The method for creating contour plots in a polar coordinate system in MATLAB was provided by the Mathworks support team on their "MATLAB 
answers" forum. Without them the displays wouldn't look nearly as good!

## License ##

MIT license, feel free to use and develop for your own investigations!

