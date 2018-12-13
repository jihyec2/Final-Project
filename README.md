# Final-Project
## Introduction
It has been known that cancer has resistance to radiation, and people are still studying which therapies are optimal on treating the disease, cancer. Because some people claimed on a paper that combination of therapies with radiation schedules can be more effective on curing the cancer than radiation alone and that dedifferentiation may play an important role in radio-resistance of cancer stem cells driven tumors. Therefore, my goal for the lab rotation is investigating the claim by using mathematical modeling of cancer stem cells and their linages.


The goal for the study is to investigate the roles of the cell lineage stages in the control of tissue and organ growth. The most obvious objectives of a growth control system is to reach and maintain a specified size, but because there are many genetic facctors that can affect final size of orgen, there are diverse molecular pathways that may regulate size. 



Here, we are going to concentrate on the model with three differential equations.



From the article "Cell Lineages and the Logic of Proliferative Control" by Lander et al., I   
## Lineage Behavior in the Absence of Control
### Figure 1
![figure2](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g002)

To identify the control needs of a system, they build models and explore their behaviors. Figure 1A is a general representation of an unbranched cell lineage that begins with stem cells (type 0), has arbitrary number of transit-ampliifying stages(type 1 to n-1) and ends with a postmitotic terminal stage cell type(type n). The parametrs ![v](https://latex.codecogs.com/gif.latex?\dpi{120}&space;v_i) and ![p](https://latex.codecogs.com/gif.latex?\dpi{120}&space;p_i) represent the rate constants of cell cycle progression and the replication probabilities for each stage, respectively, and ![d](https://latex.codecogs.com/gif.latex?\dpi{120}&space;d) stands for the cell-death rate constant which represent the turnover of the terminal stage cell. This cell lineage behavior can be also represented by mathematical modeling, a system of ordinary differential equations. (Figure1B) In these equations, ![x](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_i) is type i cell number at time t, and each differential equation represents the rate of change on the population of each cell type. The differential equations for the transit amplifying stages ![d](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t),...X_{n-1}'(t)) can be represented by th sum of the production by cells of the previous lineage stage and net production(or loss) by the replication(or differentiation) of cells at the same lineage stage. Here, we are going to contruct a model with three differential equations in the absence of the feedback regulation.

![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![X1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)v_1X_1(t),$)

![X2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_2'(t)=2(1-p_1)v_1X_1(t)-dX_2(t)$)

## Feedback Control of Transit Amplifying Cells
### Figure 2
![figure3](https://journals.plos.org/plosbiology/article/figure/image?size=medium&id=info:doi/10.1371/journal.pbio.1000015.g003)  


![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![v1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2p_1-1)\frac{v_1}{1&plus;hX_2(t)}X_1(t),)

![v2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-p_1)\frac{v_1}{1&plus;hX_2(t)}X_1(t)-dX_2(t))


They develope the ODE models for cancer stem cells by giving some different types of feedback signaling. First, they give a negative feedback regulation on the Immediate Neuronal Precursor(INP) cell cycle length. They increase the INP cell cycle by decreasing its v1-parameter to inhibit the production of olfactory receptor neurons(ORN). After the removal of all ORNs, they observe that the number of ORN returns back to the steady state of the system even faster than the controlled case, and INP stays as same as the ORN steady state number from the beginning to the end. 

For this project, I resimulated this feedback by using R studio. 



![X0](https://latex.codecogs.com/gif.latex?\dpi{120}&space;$X_0'(t)=(2p_0-1)v_0X_0(t),$)

![p1](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_1'(t)=2(1-p_0)v_0X_0(t)&plus;(2\frac{p_1}{1&plus;gX_2(t)}-1)v_1X_1(t),)

![p2](https://latex.codecogs.com/gif.latex?\dpi{120}&space;X_2'(t)=2(1-\frac{p_1}{1&plus;gX_2(t)})v_1X_1(t)-dX_2(t))

They derived another ODE model by giving negative feedback on the INP replication probability, decreasing p1-parameter, to slow the INP divisions. After perturbation, the regeneration rate of ORN becomes 100 times faster than that without feedback, but the INP cell number suddenly increases at the beginning but rapidly decreases close to its steady state value(which is quite low) because the burst of INP proliferation causes the ORN production. 



