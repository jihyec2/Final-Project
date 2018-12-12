# Final-Project

It has been known that cancer has resistance to radiation, and people are still studying which therapies are optimal on treating the disease, cancer. Because some people claimed on a paper that combination of therapies with radiation schedules can be more effective on curing the cancer than radiation alone and that dedifferentiation may play an important role in radio-resistance of cancer stem cells driven tumors. Therefore, my goal for the lab rotation is investigating the claim by using mathematical modeling of cancer stem cells and their linages.

From the article "Cell Lineages and the Logic of Proliferative Control" by Lander et al., I   

![1](https://blog.naver.com/PostView.nhn?blogId=cjh4224&Redirect=View&logNo=221418062598&categoryNo=1&isAfterWrite=true&isMrblogPost=false&isHappyBeanLeverage=true&contentLength=9785&redirect=View&widgetTypeCall=true&directAccess=false#)  

I developed the ODE models for cancer stem cells by giving some different types of feedback signaling. First, I gave a negative feedback regulation on the Immediate Neuronal Precursor(INP) cell cycle length(increasing the INP cell cycle by decreasing its v1-parameter) to inhibit the production of olfactory receptor neurons(ORN). After the removal of all ORNs, I observed that the number of ORN returns back to the steady state of the system even faster than the controlled case, and INP stays as same as the ORN steady state number from the beginning to the end. 
Then I gave another negative feedback on the INP replication probability, decreasing p1-parameter, to slow the INP divisions. After perturbation, the regeneration rate of ORN becomes 100 times faster than that without feedback, but the INP cell number suddenly increases at the beginning but rapidly decreases close to its steady state value(which is quite low) because the burst of INP proliferation causes the ORN production. 
By manipulating the previous codes (decreasing four parameters, p0, p1, v0, and v1), I gave further feedback on activin (v0 and p0) and GDF11(v1 and p1) because they aimed at stem cells(Mash1+ and Sox2+) and transit amplifying cells (INP), respectively. However, I did not get a proper result on this one yet and am still working on it because there might be some errors on my code, analytic solution for the steady states, or given parameters on the article that I am working on.
Moreover, I recently started working on the same process but with different models because we modify our original ODE models for dedifferentiation. 
