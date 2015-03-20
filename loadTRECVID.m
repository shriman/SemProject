function [ dataset ] = loadTRECVID()
%LOADTRECVID 
% Read sp.list to get paths of images
% Given paths, load images (check size, channels)
% Re-construct to CIFAR-10 structure 

% Notation: 
    % - All of images in sp.list are dataset including training & testing data
    % - Size of image = 240x320x3
    % - Number of images in sp.list = 10155

close;
clc;

% Add subdirectories of current work directory 
%addpath(genpath(pwd));

fprintf('Loading training data...\n');

fprintf('Loading splist...\n');
pathOfImages = importdata('sp.list');

dataset = zeros(size(pathOfImages,1),240*320*3);

% Read paths of images and load all of them
for i=1:size(pathOfImages,1)
    % Check how many paths of images are being loaded in file sp.list
    if (mod(i,100) == 0) 
        fprintf('Loading image: %d / %d\n', i, size(pathOfImages,1));
    end
    % Load image from path
    nameOfImage = strsplit(char(pathOfImages(1)), '/'); 
    nameOfImage = char(nameOfImage(size(nameOfImage,2)));
    currentImage = imread(nameOfImage);
    % Re-construct to CIFAR-10 structure 
        % Concatenate pixel values of an image into 1 row
        % Save it to dataset
    dataset(i,:) = currentImage(:);
end

end

