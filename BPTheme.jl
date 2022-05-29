using StatsPlots, PlotThemes, Colors, Distributions, RDatasets


theme(:default); # reasonable default font sizes + QOL stuff.
default(dpi = 300) # crank this up for nicer plots
default(size = (800,500)); # plot size
default(grid = false); # gridlines
default(linewidth=2); # thicker lines
default(framestyle= :orgin); # box around outside of plot (:box, :semi, :orgin, axis )
default(label=nothing);# lines by default aren't included in legend, stops y1 ... yn spam. 

plotfont = "Computer Modern"; # same font as TeX documents for consistency 
default(fontfamily=plotfont); 
scalefontsizes(1.2); # make the font a little bigger.


# betancourt colours — should personally default to using c_dark for dark lines and c_light otherwise. 
c_light = RGB(colorant"#DCBCBC");
c_light_highlight = RGB(colorant"#C79999");
c_mid = RGB(colorant"#B97C7C");
c_mid_highlight = RGB(colorant"#A25050");
c_dark = RGB(colorant"#8F2727");
c_dark_highlight = RGB(colorant"#7C0000");

stan_colors = palette([c_dark_highlight,
                       c_dark,
                       c_mid_highlight,
                       c_mid,
                       c_light_highlight,
                       c_light]);

# bayesplot color schemes
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


default(palette = bayes_blue)


# test facet plot
x = 1:0.1:10
ys = x.^2 .+ cos.(x.^2) .- 0.1 .* x.^3
yl = x.^2  .- 0.1 .* x.^3

plot(layout = 4);
plot!(x, ys, subplot = 1, seriestype = :scatter, color = 5);
plot!(x, yl, subplot = 1, color = 2);
histogram!(rand(Beta(2,6), 10_000), subplot = 2, normalize = true, color = 5);
plot!(Beta(2,6), color = 2, subplot = 2);
hline!([2.5], subplot = 3, color = c_mid, linestyle = :dash, linewidth = 1)
plot!(rand(100,1) .+ 2, subplot = 3, color = c_dark)
hline!([0.5], subplot = 3, color = 3, linestyle = :dash, linewidth = 1)
plot!(rand(100,1), subplot = 3, color = 3)

iris = dataset("datasets", "iris")
@df iris andrewsplot!(:Species, cols(1:4), legend = :topleft, subplot = 4, color = [1 c_dark 4], opacity = 0.7)
title!("Theme Demo", subplot = 1)
