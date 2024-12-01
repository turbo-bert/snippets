set terminal svg
set output "test.svg"
set xlabel "x lbl"
set ylabel "y lbl"
set grid
set pointsize 2
set title "bla und bla\nundnoch mehr bla"
unset logscale
plot "data" using 1:2 with linespoints title "bla" pointtype 6 linecolor rgb "#000000"

