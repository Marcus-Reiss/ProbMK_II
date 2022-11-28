%% Encontrando a posicao de P2 no vetor phi 
p_vec=(t3v+tAP);
for k=1:length(p_vec)
    if p_vec(k)>2.574 & p_vec(k)<2.5743
        pos2=k
        break;
    end
end

%% Testando os valores angulares requeridos
angP1=p_vec(1)*180/pi;
angP2=p_vec(505)*180/pi;
angP3=p_vec(1000)*180/pi;
[angP1 angP2 angP3]
