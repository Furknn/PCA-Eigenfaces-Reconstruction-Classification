read_images;

% 6. Calculate PCA transformation matrix (tmatrix)
[N,~]=size(M_train_data);
mean_image=sum(M_train_data,1)/N;

% calculate average face and subtract it from the training data
average_face=double(M_train_data)-mean_image;

% calculate covariance, eigenvectors and eigenvalues
covariance=cov(average_face);
[eigvecs,eigvals]=eig(covariance);

% Arrange eigenvectors and eigenvalues in a descending order
eigvals=flip(diag(eigvals));
eigvecs=fliplr(eigvecs);

tmatrix=eigvecs;

