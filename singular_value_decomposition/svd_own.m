function [ U,S,V ] = svd_own( A )
%svd_own is a function used to get a m*n matrix's singular value
%decompostion
% input: A m*n matrix
% output: three matrixs, U¡¢Sigma¡¢V

% initialize 
siz = size(A);
assert(length(siz)==2, ['size(a) = ' size(A) ' is impossible!']);
if siz(1)<siz(2)
    A = transpose(A);
    siz = size(A)
end
U = zeros(siz(1), siz(1));
S = zeros(siz);
V = zeros(siz(2), siz(2));

% get ATA and AAT
ATA = transpose(A)*A;
AAT = A*transpose(A);

% get eigen and eigenvector, sorted by descreasing eigen value.
[V1, D1] = eig(ATA);
[D_sort,index] = sort(diag(D1),'descend');
D1 = diag(D_sort);
V1 = V1(:,index);

[V2, D2] = eig(AAT);
[D_sort,index] = sort(diag(D2),'descend');
D2 = diag(D_sort);
V2 = V2(:,index);

%disp(A);
S(1:siz(2), 1:siz(2)) = sqrt(D1);
U = V2;
V = V1;
%disp(U*S*transpose(V));
%disp(A);
return 
end

