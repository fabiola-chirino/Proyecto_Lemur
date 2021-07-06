library(warbleR)
library(Rraven)

sls <- imp_raven(path = "/media/m/CHIRINO/Proyecto Lemur/Grabaciones_direccionales", warbler.format = TRUE)

sls$sound.files <- gsub("wav$", "flac", sls$sound.files, ignore.case = TRU)

warbleR_options(X = sls, path = "/media/m/CHIRINO/Proyecto Lemur/Grabaciones_direccionales", wl = 512)

snr <- sig2noise(mar = 0.01)

tweak_spectro(sls[3, ], length.out = 50, ovlp = 95, path = "/media/m/CHIRINO/Proyecto Lemur/Grabaciones_direccionales", wl = c(100, 1000), collev.min = c(-120), flim = c(1, 5), nrow = 10, ncol = 15, pal = list(reverse.gray.colors.1, viridis::viridis, viridis::magma), width = 15.5, height = 8.5, res = 200, mar = 0.007, parallel = 3, cex = 0.5)


sa <- spectro_analysis()

apply(sa[,3:ncol(sa)], 2, mean)


sa100 <- spectro_analysis(wl = 100)

apply(sa100[,3:ncol(sa100)], 2, mean)

sa1000 <- spectro_analysis(wl = 1000, wl.freq = 512)

apply(sa1000[,3:ncol(sa1000)], 2, mean)

setwd("/media/m/CHIRINO/Proyecto Lemur/Grabaciones_direccionales")

wav_2_flac(path = "/media/m/CHIRINO/Proyecto Lemur/Grabaciones_direccionales", parallel = 3)

files
for(i in files)
system(paste("flac", i))
