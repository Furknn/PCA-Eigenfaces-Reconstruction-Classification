read_images;

% 6. Calculate PCA transformation matrix (tmatrix)
[N,~]=size(M_train_data);
mean_image_vectors=sum(M_train_data,1)/N;

% calculate average face and subtract it from the training data
mean_subtracted_image_vectors=double(M_train_data)-mean_image_vectors;

% calculate covariance, eigenvectors and eigenvalues
covariance=cov(mean_subtracted_image_vectors);
[eigvecs,eigvals]=eig(covariance);

% Arrange eigenvectors and eigenvalues in a descending order
eigvals=flip(diag(eigvals));
eigvecs=fliplr(eigvecs);

tmatrix=eigvecs;

