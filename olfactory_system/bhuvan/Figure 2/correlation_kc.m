function correlation_kc(s)
i = randi(100);
KC1 = s.KC1(1:50,:,i);
KC2 = s.KC2(1:50,:,i);
CorrKC = zeros(50,50);

for i = 1:50
    for j = 1:50
        corr = corrcoef(KC1(i,:),KC2(j,:));
        if isnan(corr(1,2))
            corr(1,2) = 0;
        end
        CorrKC(i,j) = corr(1,2);
    end
end
pcolor(CorrKC);
xlabel('KCs in individual A');
ylabel('KCs in individual B');
colorbar();
caxis([-1,1]);
end