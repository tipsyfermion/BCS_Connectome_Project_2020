function [KC_totcor] = kc_totcor(kca,kcb)
%Calculates the correlation associated with the total (all the 2000
%KCs) KC responses in the two individuals A and B.

%where kca is the matrix of 2000 KCs response for 100 different odors of
%individual A
%and kcb, individual B.

kcatot=sum(kca,1)';
kcbtot=sum(kcb,1)';

KC_totcor=corr(kcatot,kcbtot);
end

