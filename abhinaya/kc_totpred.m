function [KCtotalPREDstereotypy] = kc_totpred(kca,kcb)
%Calculates the PRED stereotypy associated with the total (all the 2000
%KCs) KC responses in the two individuals A and B. 

%where kca is the matrix of 2000 KCs response for 100 different odors of
%individual A
%and kcb, individual B.

kcatot=sum(kca,1)';
kcbtot=sum(kcb,1)';

KCtotalPREDstereotypy=stereotypy(kcatot,kcbtot);

end

