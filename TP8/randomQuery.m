function [ ] = randomQuery()

    global indexQuery;
    global Sim;
    nbim = size(Sim,1);
    indexQuery = floor(rand() * nbim + 1); 
    AfficheSim_Interactif();

end