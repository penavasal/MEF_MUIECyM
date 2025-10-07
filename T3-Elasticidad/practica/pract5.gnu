#
# Cilindro en deformacion plana
#
a=0.5
b=1.0
p=300e6
nu=0.3
yo=2.1e11
set xrange [0.5:1]
sr(x)=-p*(b**2/x**2-1)/(b**2/a**2-1)
st(x)=p*(b**2/x**2+1)/(b**2/a**2-1)
sz(x)=nu*(sr(x)+st(x))
u(x)=(1+nu)*p/(yo*(b**2/a**2-1))*((1-2*nu)*x+b*b/x)
set grid
#set terminal postscript color landscape
#set output "cilpst_r.eps"
set title "Tension radial"
plot sr(x) t "Solucion exacta","cilpst.res" using 2:4 t "MEF"
pause -1
#set output "cilpst_c.eps"
set title "Tension circunferencial"
plot st(x) t "Solucion exacta","cilpst.res" using 2:5 t "MEF"
pause -1
#set output "cilpst_a.eps"
set title "Tension axial"
plot sz(x) t "Solucion exacta","cilpst.res" using 2:6 t "MEF"
pause -1
#set output "cilpst_ur.eps"
set title "Desplazamiento radial"
plot u(x) t "Solucion exacta","cilpst.res" using 2:3 t "MEF"
