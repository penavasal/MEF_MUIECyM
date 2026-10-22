set terminal fig color textspecial
set output "cookcon.fig"
set yrange [0:1.6]
set grid
set xlabel "$N$"
set ylabel "$v$"
plot "flecha.dat" using 1:2 t "$\\overline{\\boldsymbol{B}}$" with linesp,"flecha.dat" using 1:3 t "$Q1/E4$" with linesp,"flecha.dat" using 1:4 t "$Q1/E5$" with linesp,"flecha.dat" using 1:5 t "$Q1/E7$" with linesp
