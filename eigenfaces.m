% Create transformation matrix using training data
transform_matrix

% show 10 eigenfaces 
figure;
for i=1:10    
    eigenface=reshape(mat2gray(tmatrix(:,i)),[im_xsize,im_ysize])';
    subplot(2,5,i), imshow(eigenface);
    title(i+". Eigenface")
end
sgtitle("Eigenfaces")

