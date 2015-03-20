function [ dataset ] = loadTrainingData()
%LOADTRECVID 
% from, to determine the number of images being loaded = to-from+1
% Read sp.list to get paths of images
% Given paths, load images (check size, channels)
% Re-construct to CIFAR-10 structure 

% Notation: 
    % - All of images in sp.list are dataset are used for training
    % - Size of image = 240x320x3 but some of them are different such as
    % 240x360x3. Then, resize then into 240x320x3
    % - Total number of images in sp.list = 10155

close;
clc;

% Add subdirectories of current work directory 
%addpath(genpath(pwd));

fprintf('Loading training data...\n');

pathOfImages = importdata('sp.list');

numImages = size(pathOfImages,1);
sizeImg = [240 320 3];

dataset = zeros(numImages,240*320*3);
% Read paths of images and load all of them
for i=1:numImages
    % Check how many paths of images are being loaded in file sp.list
    if (mod(i,100) == 0) 
        fprintf('Loading image: %d / %d\n', i, numImages);
    end
    fprintf('Loading image: %d\n', i);
    % Load image from path
    img = imread(char(pathOfImages(i))); 
    
    % Check if size of image is not standarized, resize it
    tf = isequal(size(img),sizeImg);
    if (tf == 0)
        img = imresize(img, [240, 320]);
    end
    % Re-construct to CIFAR-10 structure 
        % Concatenate pixel values of an image into 1 row
        % Save it to dataset
    dataset(i,:) = img(:);
end

end

