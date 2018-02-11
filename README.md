# Spinning-cylinders-in-a-B-field #

A simulation of a conducting metal cylinder rotating inside of a constant magnetic field, developed initially just to see how the 
magnetic field lines (contours of the B-field) change over time due to the rotation of the cylinder. Some pretty interesting results are 
shown and a lot of mid-depth analysis into the convergence and stability of finite difference methods included.

Code initially developed as a peice of coursework in MATLAB but now extended to incorporate more features such as stablility and
convergence analysis, (eventually) a shift into Python+Fortran and some better looking plots. 

<a href="https://imgur.com/HCmheJ3"><img src="https://i.imgur.com/HCmheJ3.png" title="source: imgur.com"/></a>

## Summary of abilities ##

- Solves a system of coupled Partial differential equations in 1-D with Finite difference methods
- Shows the distortion of magnetic field lines via polar contour plots
- Performs numerical analysis on the rate of convergence of solutions and the stability of Finite difference methods
- (eventually will) Demonstrates the use of F2PY for vastly improved performance of iterative code whilst handling all higher-level problems in Python

## Requirements and Installation ## 

- Matlab 2017a or newer (older versions may work, check their documentation on logical arrays)
  - Simply install Matlab via the Mathworks <a href="https://uk.mathworks.com/products/matlab.html?s_tid=hp_products_matlab">website</a>
  - Fork and clone all the .m files into your MATLAB working directory, or even better, into your Matlab <a href="https://uk.mathworks.com/products/matlab-drive.html?s_tid=MLD_MLDOSI">drive</a>
- Alternatively, you can use <a href="https://uk.mathworks.com/products/matlab-online.html">Matlab online</a> through an internet browser, not ideal but usable.
  - Using Matlab drive is essential in this case

(NOTE: Matlab is not open source, and so to obtain the software you'll need a Mathworks license. For students this is free via your 
institution, otherwise you can always adapt the code slightly and use it in GNU Octave) (see its documentation for more details)

## Usage ##

The code built here find the value of:

<a href="https://imgur.com/HCmheJ3"><img src="https://i.imgur.com/HCmheJ3.png" title="source: imgur.com"/></a>

at any given time or location (so long as distance from origin is less than 2, just a scaling thing). The catch is that a and
b both change as:

<a href="https://imgur.com/HCmheJ3"><img src="https://i.imgur.com/HCmheJ3.png" title="source: imgur.com"/></a>

and so we require Finite difference methods to numerically solve this over space and time. The function Solve_fieldlines takes
some inputs that the FDM requires and outputs the plot of what the magnetic field looks like over all of space and at a 
specific moment in time. Of course, the time at which this is will be the number of time steps multiplied by the size of 
each time step. You can also alter the value of "n" to see how this changes the solution, or the time at which the solution
reaches a certain stage or limit!

To get a better idea of this, and certainly in a more quantitative way, make use of the script convergence_time and simply 
press run (of course you can alter some values and initial conditions if you like). one of the results of the script
will hopefully look like: 

<a href="https://imgur.com/kxhyyvW"><img src="https://i.imgur.com/kxhyyvW.png" title="source: imgur.com"/></a>

With this, you should be able to tell from the gradient with which power the time taken for the solution to converge 
changes as the value of n changes. Now you can change your value of "n" to whatever you wish to suit the inital 
conditions and angular velcoity of the cylinder to ensure the solution converges at a given time. Quite powerful
if you want to have control over how quickly or slowly things happen.

Perhaps instead you're more worried about how stable the FDM is? Well you can use the Stability_restrictions script
to see how the largest possible value of time step size k changes with space step size h. This lets you find the
perfect step size for accuracy and speed to acheive a solution at a certain point in time with fewer iterations.
One of the result of this script should look like:

<a href="https://imgur.com/isns73R"><img src="https://i.imgur.com/isns73R.png" title="source: imgur.com"/></a>

Which will let you quite easily see what the largest value of k for a specific h is. Now you as you increase h
to get a more accurate solution in space, you can also increase k by a known amount to reduce the number of 
iterations on the finer grid to keep the runtime decent. This is a purely numerical approach to this stability
issue, but if you like perhaps you can somehow apply analytic methods to find the exact expression for the
relationship between k and h?

Finally, you can even see how a and b themselves vary over time at a certain radius with the Solve_intermediates
function. Inputs are all explained in the code, but essentially you choose a certain radius and choose how long
you want to record the values of a and b there, and get a nice plot showing the change, looking like this:

<a href="https://imgur.com/PQUyQ6H"><img src="https://i.imgur.com/PQUyQ6H.png" title="source: imgur.com"/></a>

Quite useful to get a rough and quick idea of when convergence might occur for given parameters. 

Thats all there is to this code, so feel free to go and explore and make amazing plots. For a slightly more
in depth explanation and dicussion on all this, check out my final report on all this above.

## Contributing ##

If you'd like to improve on my work or suggest any corrections/fixes to me for something that may not be fully working then please feel 
free to. I'm still learning a lot about computational PDE's!

## Credits ##

The method for creating contour plots in a polar coordinate system in MATLAB was provided by the Mathworks support team on their "MATLAB 
answers" forum. Without them the displays wouldn't look nearly as good! the questions themselves came from Prof. J. Mestel's 
Computational PDE's course taught at Imperial College London (2018), so all credit for the problem itself and the inspiration goes to
him.

## License ##

MIT license, feel free to use and develop for your own investigations!

