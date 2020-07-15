%Generates PN spikes with no_pn x no_odor as dimention
function y = PN_Spikes(no_pn,no_odor)
rng(randi(1000000));
i = randi([0 1],no_pn,no_odor);
s = randi([10 30],no_pn,no_odor);
y = i.*s;
end