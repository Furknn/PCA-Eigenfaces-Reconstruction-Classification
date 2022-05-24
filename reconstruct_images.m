% Create transformation matrix using training data
transform_matrix

j=1;
i=26;
for r=[5 10 100 150 500 700 1000 1584]
    % Reduce dimensionality
    tmatrix=eigvecs(:,1:r);

    % calculate feature vector
    image_features=tmatrix'*double(M_train_data)';

    % reconstruct image
    reconstructed_image_vectors=(tmatrix*image_features);

    % show image
    face=reshape(reconstructed_image_vectors(:,i),[im_xsize,im_ysize]);
    face=mat2gray(face');
    subplot(2,4,j), imshow(face);
    title(r+" Eigenvectors")
    j=j+1;
end
sgtitle("Reconstructed Faces")