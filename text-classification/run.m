%% load data
%ham_train contains the occurrences of each word in ham emails. 1-by-N vector
ham_train = csvread('ham_train.csv');
%spam_train contains the occurrences of each word in spam emails. 1-by-N vector
spam_train = csvread('spam_train.csv');
%read the word dictionary
[word, index] = textread('all_word_map.txt', '%s\t%d');
%N is the size of vocabulary.
N = size(ham_train, 2);
%There 9034 ham emails and 3372 spam emails in the training samples
num_ham_train = 9034;
num_spam_train = 3372;
%Do smoothing
x = [ham_train;spam_train] + 1;

%% train
% likelihood
word_sum = sum(x, 2);
l = zeros(size(x));
l = x ./ word_sum;

%prior
total_sum = sum(word_sum);
pri = zeros(2,1);
pri = word_sum ./ total_sum;

%% highest 10 word
spam_ham_ratio = zeros(1, size(x, 2));
spam_ham_ratio = l(2, :) ./ l(1, :);
[B, I] = sort(spam_ham_ratio, 'descend');
Max_Index= I(1: 10);
fprintf("Top 10 spam words: \n");
disp(word(Max_Index));

%% test
%ham_test contains the occurences of each word in each ham test email. P-by-N vector, with P is number of ham test emails.
load ham_test.txt;
ham_test_tight = spconvert(ham_test);
ham_test = sparse(size(ham_test_tight, 1), size(ham_train, 2));
ham_test(:, 1:size(ham_test_tight, 2)) = ham_test_tight;
%spam_test contains the occurences of each word in each spam test email. Q-by-N vector, with Q is number of spam test emails.
load spam_test.txt;
spam_test_tight = spconvert(spam_test);
spam_test = sparse(size(spam_test_tight, 1), size(spam_train, 2));
spam_test(:, 1:size(spam_test_tight, 2)) = spam_test_tight;

%% TODO
%Implement a ham/spam email classifier, and calculate the accuracy of your classifier
F_h_c = size(ham_test, 1);
ham_correct = 0;
for n=1:1:F_h_c
    [, c] = find(ham_test(n, :));
    res = log(l(:, c))* (ham_test(n, c))' + log(pri);
    if (res(1) > res(2))
        ham_correct = ham_correct + 1;
    end
end
fprintf("ham correct num = %d/%d\n", ham_correct, F_h_c);

F_s_c = size(spam_test, 1);
spam_correct = 0;
for n=1:1:F_s_c
    [, c] = find(spam_test(n, :));
    res = log(l(:, c))* (spam_test(n, c))' + log(pri);
    if (res(1) < res(2))
        spam_correct = spam_correct + 1;
    end
end
fprintf("spam correct num = %d/%d\n", spam_correct, F_s_c);
fprintf("accuracy = %6f\n", (spam_correct+ham_correct)/(F_s_c + F_h_c));

    











