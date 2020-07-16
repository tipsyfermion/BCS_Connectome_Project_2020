function [KC_MBON_matrix] = kc_mbon_matrix(no_of_KC)
%Gives the connection matrix between the 2000 KCs and MBON. The first 1000
%KCs are taken to be responding

KC_MBON_matrix =zeros(no_of_KC,1);
KC_MBON_matrix(1:1000,:)=1;
end

