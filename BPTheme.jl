#=
Using() this file will change the plotting defaults to something a little nicer for Bayesian stuff. 
needs Colors, Plots as dependencies in main file!
=#

plotfont = "Computer Modern"; # Same font as TeX documents for consistency 

default(dpi = 300,            # Crank this up for nicer plots
        size = (800,500),     # Plot size
        grid = false,         # Gridlines
        linewidth=2,          # Thicker lines
        framestyle= :orgin,   # Box around outside of plot (:box, :semi, :orgin, axis )
        label=nothing,        # Lines by default aren't included in legend, stops y1 ... yn spam. 
        fontfamily=plotfont)

#scalefontsizes(1.1); # Make the font a little bigger. Very sketchy in how it persists in the REPL.

# Betancourt colours — should personally default to using c_dark for dark lines and c_light otherwise. 
# From Brownian Bridge case study. 
c_light = RGB(colorant"#DCBCBC");
c_light_highlight = RGB(colorant"#C79999");
c_mid = RGB(colorant"#B97C7C");
c_mid_highlight = RGB(colorant"#A25050");
c_dark = RGB(colorant"#8F2727");
c_dark_highlight = RGB(colorant"#7C0000");


# Colour Palettes -------------------------------------------------------------------------------------
# Some colour palettes, mostly from Bayes Plot. 

stan_colors = palette([c_dark_highlight,
                       c_dark,
                       c_mid_highlight,
                       c_mid,
                       c_light_highlight,
                       c_light]);

# Bayesplot color schemes
bayes_blue = palette([RGB(colorant"#011f4b"),
                       RGB(colorant"#03396c"),
                       RGB(colorant"#005b96"),
                       RGB(colorant"#6497b1"),
                       RGB(colorant"#b3cde0"),
                       RGB(colorant"#d1e1ec")]);

bayes_teal = palette([RGB(colorant"#007C7C"),
                      RGB(colorant"#278f8f"),
                      RGB(colorant"#50a2a2"),
                      RGB(colorant"#7cb9b9"),
                      RGB(colorant"#99c7c7"),
                      RGB(colorant"#bcdcdc")]);

# Set default.
default(palette = stan_colors)

