
# Beispiel

taxonomy <- data.frame(string=c("Maus", "Haus", "Klaus", "Schmaus", "Hartholz"), cluster=c(1, 1, 1, 2, 3))
hierarchy <- data.frame(cluster=c(1, 2, 3), partOf=c(0, 1, 0), center=c("Haus", "Schmaus", "Hartholz"), variance=c(1.3, 0, 0))

