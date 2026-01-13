#!/opt/local/bin/gnuplot -persist
#
# set terminal fig monochrome small pointsmax 1000 landscape metric solid textnormal font "Times Roman,10" linewidth 2 depth 10 version 3.2
# set output 'parabola.fig'
unset border
unset tics
set parametric
plot [:][0:1] 0.3*(1-t**2),t notitle lw 2
set terminal fig monochrome small pointsmax 1000 landscape metric solid textnormal font "Times Roman,10" linewidth 1 depth 10 version 3.2
set output 'parabola.fig'
replot
#    EOF
