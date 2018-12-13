# Cell Lineages and the Logic of Proliferative Control by Arthur Lander, Kimberly K. Gokoffski,...
#Nofeedback <- function(times, y, parms) {
#  dX0 <- (2*p0-1)*v0*X[0]
#  dX1 <- 2*(1-p0)*v0*X[0]+(2*p1-1)*v1*X[1]
#  dX2 <- 2*(1-p1)*v1*X[1]-d*X[2]
#  list(c(dx0, dx1, dx2))
#}
# Feedback control on v1->v1/(1+h*y[2]) (Figure 1B-C) Using Euler's method

library(deSolve)
library(ggplot2)

# Set parameters
T <- 40 
dt <- 0.05  
N <- T/dt

v1bar <- 1/log(2)
v0 <- 0.128*v1bar
p0 <- 0.5
p1 <- 0.495
d <- 0.0372*v1bar
h <- 0.0734

#Initialize vector t and v
t=rep(0,N) #(0:dt:T)
t[1] <- 0
v1=rep(0,N)

#Initial conditions without feedback
y0=rep(0,N)
y1=rep(0,N)
y2=rep(0,N)
y0[1] <- 1
y1[1] <- 11.3
y2[1] <- 0

#Initial conditions with feedback on v1
x0=rep(0,N)
x1=rep(0,N)
x2=rep(0,N)
x0[1] <- 1
x1[1] <- 339.311
x2[1] <- 0

# Without feedback 
for (i in 1:N)
{
  y0[i+1]= y0[i]+dt*((2*p0-1)*v0*y0[i])
  y1[i+1] = y1[i]+dt*(2*(1-p0)*v0*y0[i]+(2*p1-1)*v1bar*y1[i])
  y2[i+1] = y2[i]+dt*(2*(1-p1)*v1bar*y1[i]-d*y2[i])
  t[i+1] = t[i]+dt
}

# With feedback on v1
for (i in 1:N)
{ v1[i]=v1bar/(1+h*x2[i]);
  x0[i+1]= x0[i]+dt*((2*p0-1)*v0*x0[i])
  x1[i+1] = x1[i]+dt*(2*(1-p0)*v0*x0[i]+(2*p1-1)*v1[i]*x1[i])
  x2[i+1] = x2[i]+dt*(2*(1-p1)*v1[i]*x1[i]-d*x2[i])
  t[i+1] = t[i]+dt
}

df <- data.frame(t,x0,x1,x2,y2)

require(ggplot2)
Figure3C <- ggplot(df, aes(t)) +
  geom_line(aes(y=x0), colour="black", lwd = 1, show.legend=TRUE) +
  geom_line(aes(y=x1), colour="red", lwd = 1, show.legend=TRUE) +
  geom_line(aes(y=x2), colour="blue", lwd = 1, show.legend=TRUE) +
  geom_line(aes(y=y2), colour="black", lwd = 1, lty=2, show.legend=TRUE)


Figure3C + labs(title="(-) Feedback on the INP cell cycle length", x="time(ln(2)/v1)", y="Cell Number") 
