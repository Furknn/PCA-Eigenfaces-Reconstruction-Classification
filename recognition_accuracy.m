% Create transformation matrix using training data
transform_matrix

% iterate over dimensionalities between 1 and 100
accuracies=[];
for PCA_dim=1:100
    tmatrix=eigvecs(:,1:PCA_dim);
    train_image_features=tmatrix'*double(M_train_data)';
    
   % predict
    error_count=0;
    predictions=[];
    for i=1:N

        % calculate feature vector of the test image
        test_image_vector=M_test_data(i,:);
        test_feature_vector=tmatrix'*double(test_image_vector)';
        
        % calculate euclidean distances between test feature and all
        % training features
        distance=hweuclidean(train_image_features,test_feature_vector);
        
        % calculate error
        [~,index]=min(distance);
        test_image_label=M_test_labels(i);
        predicted_image_label=M_train_labels(index);
        
        % if prediction is false increase error
        if (test_image_label~=predicted_image_label)
            error_count=error_count+1;
        end
        predictions=[predictions;predicted_image_label];
    end
    
    % calculate accuracy
    accuracy=(1-(error_count/N))*100;
    accuracies=[accuracies;accuracy];

end

% accuracy plot
plot(accuracies);

xlabel("PCA dimensionality","FontSize",20);
ylabel("Recognition Rate","FontSize",20);
title("Recognition Accuracies for different PCA dimensionalities","FontSize",20)


