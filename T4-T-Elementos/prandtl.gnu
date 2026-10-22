set terminal fig color textspecial
set output "punchfd.fig"
set xlabel "$\\frac{E \\delta}{\\sigma_Y H}$"
set ylabel "$F$"
set yrange [0:300]
set grid
p(x)=-x
plot "sigth.dat" t "Carga límite exacta" with lines,"sigq4.dat" thru p(x) t "$Q4$" with linesp,"sigbb.dat"  thru p(x) t "$\\overline{\\boldsymbol{B}}$" with linesp,"sige4.dat" thru p(x) t "$Q1/E4$" with linesp
