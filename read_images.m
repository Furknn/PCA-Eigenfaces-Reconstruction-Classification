% read_images.m
clear; clc; close all;

% 1. set image resolution parameters (im_res)
im_res = 44 * 36;
im_xsize = 36;
im_ysize = 44;
% 2. set PCA dimensionality parameter (PCA_DIM)
PCA_dim = 200; 

% 3. Read training images
% 4. Form training data matix (M_train_data)
% 5. Form training class labels matrix (M_train_labels)
r = 1;
for i = 1:40
    % for each of the 40 people
    for j = 1:5
        % for each of the 5 images of a person
        filename = ['./train_images/s' num2str(i) '/' num2str(j) '.bmp'];
        im = imread(filename);
        % show image
        % imshow(im); 
        % title(['Training image ' num2str(j) ' subject ' num2str(i)]);
        % drawnow;
        % put training data into a matrix
        im2 = im';
        M_train_data(r,:) = (im2(:))'; % training data
        M_train_labels(r) = i;  % training data labels 
        
        % read the test faces into a matrix
        filename = ['./test_images/s' num2str(i) '/' num2str(j) '.bmp'];
        im = imread(filename); 
        im2 = im';
        M_test_data(r,:) = (im2(:))'; % test data
        M_test_labels(r) = i; % test data labels
        r = r + 1;
    end
end

clear r i j im im2 filename
