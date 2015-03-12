function [featureMap] = extractFeatures_old(trainX,imageSizeX,imageSizeY,centers,patchSizeX,patchSizeY,colorChannels,sampleRate)
%EXTRACTFEATURES Summary of this function goes here
%this function is used to extract features fromthe test images given the
%centroids and
%here an image is sent as input to the function

%reshape the input data and the centroids so the concolution can be
%performed
numberOfImages = size(trainX,1);
% trainX = reshape(trainX,numberOfImages,imageSizeX,imageSizeY,colorChannels);

numberOfCenters = size(centers,1); 
centers = reshape(centers,numberOfCenters,patchSizeX,patchSizeY,colorChannels);

%now apply the convlution funciton

row = imageSizeX - patchSizeX +1;
col = imageSizeY - patchSizeY +1;
noOfSamples = row*col;
featureMap = [];
fprintf('extracting feature:');
for i = 1:1:numberOfImages
    
    feature = zeros(1,noOfSamples,numberOfCenters*colorChannels);
    if (mod(i,10000) == 0) 
           fprintf('extracting feature: %d / %d\n', i, numberOfImages);
    end
    image = trainX(i,:,:,:);
    image = reshape(image,imageSizeX,imageSizeY,colorChannels);
    for j = 1:1:numberOfCenters
        mask = centers(j,:,:,:);
        mask = reshape(mask,patchSizeX,patchSizeY,colorChannels);
        %now use convn function in matlab to optimize the convolution
        
        for k=1:1:colorChannels
            imageFeature = conv2(image(:,:,k),mask(:,:,k),'valid');
            imageFeature = reshape(imageFeature,1,noOfSamples,1);
%             imageFeature = downsample(imageFeature,sampleRate);
            pos = (j-1)*colorChannels + k;
            feature(1,:,pos) = imageFeature; 
        end
        
    end
    feature =  downsample(feature,sampleRate);
    featureMap = [featureMap;feature];
end

for i=1:1:numberOfCenters
    masks = centers(i,:,:,:);  
    masks = reshape(masks,patchSizeX,patchSizeY,colorChannels);
    for j =1:1:colorChannels
        mask = mask(:,:,1);
        images = trainX(:,:,j);
        images = images';
        images = reshape(images,imageSizeX,imageSizeY,numberOfImages);
        feature = convn(images,mask,'valid');
        
        
    end
    
end

end

