# Cell Lineages and the Logic of Proliferative Control by Arthur Lander, Kimberly K. Gokoffski,...
#Nofeedback <- function(times, y, parms) {
#  dX0 <- (2*p0-1)*v0*X[0]
#  dX1 <- 2*(1-p0)*v0*X[0]+(2*p1-1)*v1*X[1]
#  dX2 <- 2*(1-p1)*v1*X[1]-d*X[2]
#  list(c(dx0, dx1, dx2))
#}
# Feedback control on p1->p1/(1+g*X[2]) (Figure 1D-E)

times <- seq(0, 10, by = 0.01)
library(deSolve)
library(ggplot2)

# Set parameters
T <- 100
dt <- 0.05 
N <- T/dt

v1 <- 1/log(2) #division rate for X1
v0 <- 0.506*v1 #division rate for X0
p0 <- 0.5 #self renewal probability
p1bar <- 0.942
d <- 0.0138*v1 #death rate
g <- 0.0449 

#Initialize vector t and v
t=rep(0,N)
t[1] <- 0
p1=rep(0,N)

#Initial conditions with feedback on v1
X0=rep(0,N)
X1=rep(0,N)
X2=rep(0,N)
X0[1] <- 1
X1[1] <- 0.7916
X2[1] <- 0

for (i in 1:N)
{ p1[i]=p1bar/(1+g*X2[i]);
X0[i+1]= X0[i]+dt*((2*p0-1)*v0*X0[i]) #stem cell
X1[i+1] = X1[i]+dt*(2*(1-p0)*v0*X0[i]+(2*p1[i]-1)*v1*X1[i]) #INP(transit amplifying cell)
X2[i+1] = X2[i]+dt*(2*(1-p1[i])*v1*X1[i]-d*X2[i]) #ORN(Terminally differentiated cell)
t[i+1] = t[i]+dt #time
}

df <- data.frame(t,X0,X1,X2)

require(ggplot2)
Figure3E <- ggplot(df, aes(t)) +
  geom_line(aes(y=X0), colour="black", lwd = 1, show.legend=TRUE) +
  geom_line(aes(y=X1), colour="red",lwd = 1, show.legend=TRUE) +
  geom_line(aes(y=X2), colour="blue", lwd = 1, show.legend=TRUE) 

Figure3E + labs(title="(-) Feedback on the INP replication probability", x="time(ln(2)/v1)", y="Cell Number") 
