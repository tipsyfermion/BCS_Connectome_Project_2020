function [stereotypy] = pairstereotypy(response)
%Calculates PRED stereotypy for a pair of odors in a pair of individuals.
D1=sum(diff(response).^2);
data=response;
data(2,:)=data(2,2:-1:1);
D2=sum(diff(data).^2);

stereotypy=(D2-D1)./(D2+D1);
end

