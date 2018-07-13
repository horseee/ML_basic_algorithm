load('TDT2_data', 'fea', 'gnd');
test_round = 50;

% YOUR CODE HERE
W = constructW(fea);
W = full(W);
AC = 0;
MIhat = 0;
for i=1:test_round
    idx_spectral = spectral(W, 5, 3);
    idx_spectral = changeClass(gnd, idx_spectral);

    AC = AC + length(find(gnd == idx_spectral))/length(gnd);
    MIhat = MIhat + MutualInfo(gnd,idx_spectral);
end
fprintf("Spectral clustering: Accuracy = %.5f, MutualInfo = %.5f\n" , AC/test_round, MIhat / test_round);

AC = 0;
MIhat = 0;
for i=1:test_round
    idx_kmeans = kmeans(W, 5);
    idx_kmeans = changeClass(gnd, idx_kmeans);

    AC = AC + length(find(gnd == idx_kmeans))/length(gnd);
    MIhat = MIhat + MutualInfo(gnd,idx_kmeans);
end
fprintf("Kmeans: Accuracy = %.5f, MutualInfo = %.5f\n" , AC/test_round, MIhat / test_round);

