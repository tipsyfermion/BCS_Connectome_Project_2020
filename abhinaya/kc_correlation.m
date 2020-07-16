function [KC_correlation] = kc_correlation(kca,kcb)
%   where kca is the matrix of 2000 KCs response for 100 different odors of
%   individual A
%   and kcb, individual B.

%This function returns the correlation between the two individuals' individual KCs for all 2000
%of them.

KC_correlation=zeros(2000,1);
for i=1:2000
KC_correlation(i,:)=corr(kca(i,:)',kcb(i,:)');
end
end

