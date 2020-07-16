%Calculates PRED where inputs are the responces of two individual
%for a pair of odor
function y = PRED(a1,a2,b1,b2)
M11 = a1;
M12 = a2;
M21 = b1;
M22 = b2;
d1 = (M11 - M21).^2 + (M12 - M22).^2;
d2 = (M11 - M22).^2 + (M12 - M21).^2;
y = (d2 - d1)/(d2 + d1);
end

