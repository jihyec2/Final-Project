# Final-Project
## Introduction

In recent studies, cell lineages are considered as fundamental units of tissue and organ development, maintenance, and regeneration, and stem cells, which have ability to produce many cell types and to maintain their own number through self replication, are found at the begining of lineages. Therefore, scientists get interested in studying them with the mechanisms underlying the execution and regulation of cell lineages to use the knowledge to repair injury and to cure disease, such as cancer or tumor. Because lineage intermediates often display the ability of self-replication, it is suggested that lineage play crucial roles in controlling tissue and organ growth (cell population growth). So on the article "Cell Lineages and the Logic of Proliferative Control" by Lander et al., the authors use the context of the mammalian olfactactory epithelium(OE) to study the relationship between lineages and growth control. They investigate how negative feedback factors may be used to control the output of multistage cell lineages, as exemplified by the actions of GDF11 and activin in a self-renewing neural tissue, OE.   

## Lineage Behavior in the Absence of Control
### Figure 1
![figure2](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g002)

To identify the control needs of a system, the authors build models and explore their behaviors. Figure 1A is a general representation of an unbranched cell lineage that begins with stem cells (type 0), has arbitrary number of transit-ampliifying stages(type 1 to n-1) and ends with a postmitotic terminal stage cell type(type n). The parametrs ![v](https://latex.codecogs.com/gif.latex?\dpi{120}&space;v_i) and ![p](https://latex.codecogs.com/gif.latex?\dpi{120}&space;p_i) represent the rate constants of cell cycle progression and the replication probabilities for each stage, respectively, and ![d](https://latex.codecogs.com/gif.latex?\dpi{120}&space;d) stands for the cell-death rate constant which represent the turnover of the terminal stage cell. This cell lineage behavior can be also represented by mathematical modeling, a system of ordinary differential equations. (Figure1B) In these equations, ![x](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_i) is type i cell number at time t, and each differential equation represents the rate of change on the population of each cell type. The differential equations for the transit amplifying stages (![d](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t),...X_{n-1}'(t)))can be represented by the sum of the production by cells of the previous lineage stage and net production(or loss) by the replication(or differentiation) of cells at the same lineage stage. 

### Figure 2
![figure3](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g003)  

The olfactactory epithelium(OE) of the mouse is useful to study lineage progression and feedback because of its self renewal, well defined lineage stages, and many other factors. The OE neuronal lineage consists of a stem cell, which give rise to cells that express another proneural gene, Immediate Neuronal Precursor(INP), which is a transit amplifying cell stage. The INP appears to give rise to terminally differentiated cell, olfactory receptor neurons(ORNs) (Figure 2A). The following system is the mathematical model for this lineage, consisting with three ordinary differential equations, in the absence of the feedback regulation.

![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![X1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)v_1X_1(t),$)

![X2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_2'(t)=2(1-p_1)v_1X_1(t)-dX_2(t)$)

## Feedback Control of Transit Amplifying Cells
GDF11, a member of transforming growth factor, was shown to be produced specifically by cells of the neuronal lineage of the mouse OE, and to provide feedback to inhibit the production of neurons(ORN) 

 First, they give a negative feedback regulation on the Immediate Neuronal Precursor(INP) cell cycle length(Figure2B). The following is the system of the ordinary differential equations with the feedback on v1. 

 ![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![v1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)\frac{v_1}{1&plus;hX_2(t)}X_1(t),)

![v2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-p_1)\frac{v_1}{1&plus;hX_2(t)}X_1(t)-dX_2(t))

 They increase the INP cell cycle by decreasing its v1-parameter to inhibit the production of olfactory receptor neurons(ORN). After the removal of all ORNs, they observe that the number of ORN returns back to the steady state of the system even faster than the controlled case, and INP stays as same as the ORN steady state number from the beginning to the end(Figure2C). In other words, feedback enables the system to regenerate faster, and we can speed it up with larger feedback gain(the parameter h) by driving down the steady state of ORN. 

Here, I resimulated this feedback by using R studio(I accessed R studio through terminal, using X2go).

    $cd Homework4
    $module load rstudio/0.99.9.9
    $rstudio

    #######Everything below is done in Rstudio.#######

    # Feedback control on v1->v1/(1+h*y[2]) (Figure 1B-C) I code this system by using Euler's method.

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

    #Initial conditions on the system without feedback
    y0=rep(0,N)
    y1=rep(0,N)
    y2=rep(0,N)
    y0[1] <- 1
    y1[1] <- 11.3
    y2[1] <- 0

    #Initial conditions on the system with feedback on v1
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

![figure3c](https://blogfiles.pstatic.net/MjAxODEyMTRfMjY1/MDAxNTQ0NzE1ODMwMDU3.hlmOxppOOr2U2ksbLsTlSEqz1ebbrfJPQl4LtoEGt40g.84rTNz2lJZVITfGsP3zv7oU5H6neacgNNCReAeW9Wgwg.PNG.cjh4224/figure3C.png)


However, they claim that feeding back onto the rate at which INPs divide does not seem to be a good control strategy, so they feed back onto a different parameter of INP growth, p1, to see whether GDF11 might do a better job(Figure 2D). The following is the system of the ordinary differential equations with the negative feedback on the INP replication probability, p1,  

![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![p1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2\frac{p_1}{1&plus;gX_2(t)}-1)v_1X_1(t),)

![p2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-\frac{p_1}{1&plus;gX_2(t)})v_1X_1(t)-dX_2(t))

By decreasing p1-parameter, they try to slow the INP divisions. After perturbation, the regeneration rate of ORN becomes 100 times faster than that without feedback(Figure2E). However, the INP cell number suddenly increases at the beginning but rapidly decreases close to its steady state value(which is quite low) because the burst of INP proliferation causes the ORN production. 

Here, I resimulated this feedback by using R studio.

    $cd Homework4
    $module load rstudio/0.99.9.9
    $rstudio

    #######Everything below is done in Rstudio.#######
    
    # Feedback control on p1->p1/(1+g*X[2]) (Figure 1D-E) I code this system by using Euler's method.

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

![figure3E](https://blogfiles.pstatic.net/MjAxODEyMTRfMjUg/MDAxNTQ0NzE1NTU0MTUw.xQoouoMQ7rBjhtTk3HgGFBFto_HLVgYrhzJNCyl0I5Qg.WPudy8QBuvqlORGSgOX7mYQ9z8-F57AdfMU-mpMtkmcg.PNG.cjh4224/figure3E.png)

From these simulations, the authors conclude that the system with the feedback regulation on p1 shows more useful and realistic behaviors than that on v1, and it raised the possibility that the actual target of GDF11 might be p1, not v1. Moreover, the lineage feed back onto p1 seems to be an effective strategy for meeting two control objectives: steady state robustness(low sensitivity to stem cell number ![x00](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_0)), cell division rates v, and the death rate constant d) and rapid generation. 
