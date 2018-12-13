# Final-Project
## Introduction
It has been known that cancer has resistance to radiation, and people are still studying which therapies are optimal on treating the disease, cancer. Because some people claimed on a paper that combination of therapies with radiation schedules can be more effective on curing the cancer than radiation alone and that dedifferentiation may play an important role in radio-resistance of cancer stem cells driven tumors. Therefore, my goal for the lab rotation is investigating the claim by using mathematical modeling of cancer stem cells and their linages.

From the article "Cell Lineages and the Logic of Proliferative Control" by Lander et al., I   
## Lineage Behavior in the Absence of Control
### Figure 1
![figure2](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g002)

From figureB, we can get the system of the ODE model. 

![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![X1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)v_1X_1(t),$)

![X2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_2'(t)=2(1-p_1)v_1X_1(t)-dX_2(t)$)

## Feedback Regulation of Transit Amplifying Cells 
### Figure 2
![figure3](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g003)  


![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![v1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)\frac{v_1}{1&plus;hX_2(t)}X_1(t),)

![v2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-p_1)\frac{v_1}{1&plus;hX_2(t)}X_1(t)-dX_2(t))


![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![p1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2\frac{p_1}{1&plus;gX_2(t)}-1)v_1X_1(t),)

![p2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-\frac{p_1}{1&plus;gX_2(t)})v_1X_1(t)-dX_2(t))



$X_0'(t)=(2p_0-1)v_0X_0(t),
X_1'(t)=2(1-p_0)v_0X_0(t)+(2p_1-1)\frac{v_1}{1+h*X_2(t)}X_1(t),
X_2'(t)=2(1-p_1)\frac{v_1}{1+h*X_2(t)}X_1(t)-dX_2(t)$
$X_0'(t)=(2p_0-1)v_0X_0(t),\\
X_1'(t)=2(1-p_0)v_0X_0(t)+(2\frac{p_1}{1+gX_2(t)}-1)v_1*X_1(t),\\
X_2'(t)=2(1-\frac{p_1}{1+g*X_2(t)})v_1*X_1(t)-dX_2(t)$



I developed the ODE models for cancer stem cells by giving some different types of feedback signaling. First, I gave a negative feedback regulation on the Immediate Neuronal Precursor(INP) cell cycle length(increasing the INP cell cycle by decreasing its v1-parameter) to inhibit the production of olfactory receptor neurons(ORN). After the removal of all ORNs, I observed that the number of ORN returns back to the steady state of the system even faster than the controlled case, and INP stays as same as the ORN steady state number from the beginning to the end. 

Then I gave another negative feedback on the INP replication probability, decreasing p1-parameter, to slow the INP divisions. After perturbation, the regeneration rate of ORN becomes 100 times faster than that without feedback, but the INP cell number suddenly increases at the beginning but rapidly decreases close to its steady state value(which is quite low) because the burst of INP proliferation causes the ORN production. 








By manipulating the previous codes (decreasing four parameters, p0, p1, v0, and v1), I gave further feedback on activin (v0 and p0) and GDF11(v1 and p1) because they aimed at stem cells(Mash1+ and Sox2+) and transit amplifying cells (INP), respectively. However, I did not get a proper result on this one yet and am still working on it because there might be some errors on my code, analytic solution for the steady states, or given parameters on the article that I am working on.
Moreover, I recently started working on the same process but with different models because we modify our original ODE models for dedifferentiation. 
