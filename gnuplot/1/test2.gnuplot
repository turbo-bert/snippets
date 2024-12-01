set terminal svg
set output "test2.svg"
set xlabel "x lbl"
set ylabel "y lbl"
set grid
set pointsize 2
unset logscale

set boxwidth 0.5
set style fill solid
set style data histograms
set yrange [0:*]

plot "data2" using 1:2:xtic(2) with boxes title "bla" linecolor rgb "#000000"
