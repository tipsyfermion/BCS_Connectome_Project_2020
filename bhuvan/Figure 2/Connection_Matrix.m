% Generates Conenction Matrix between PN-KC and KC-MBON Neurons
function [PN_KC,KC_MBON] = Connection_Matrix(no_pc,no_kc,no_mbon,p)
rng(randi(1000000));
PN_KC = rand(no_pc,no_kc) < p;
KC_MBON = zeros(no_kc,no_mbon);
KC_MBON(1:1000,no_mbon) = 1;
end