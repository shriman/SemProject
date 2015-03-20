clc;
clear all;
close all;

%informatin about the dataset
imageSizeX = 32;
imageSizeY = 32;
patchSizeX = 6;
patchSizeY = 6;
colorChannels = 3;
numberOfPatches = 4000;
downsampleRate = 2;
CIFAR_DIM = [32,32,3];
%information about the k-means
numberOfCentroids = 5;


%load data from the datasets

f1 = load('data_batch_1.mat');
f2 = load('data_batch_2.mat');
f3 = load('data_batch_3.mat');
f4 = load('data_batch_4.mat');
f5 = load('data_batch_5.mat');

trainX = double(f1.data);
labels = double(f1.labels);

% trainX = double([f1.data;f2.data;f3.data;f4.data;f5.data]);
% labels = double([f1.labels;f2.labels;f3.labels;f4.labels;f5.labels]);
clear f1 f2 f3 f4 f5; % clear the stored variables form the memory

numberOfImages = size(trainX,1);
trainX = reshape(trainX,numberOfImages,imageSizeX*imageSizeY,colorChannels);

patches = generateRandomPatch(trainX,imageSizeX,imageSizeY,patchSizeX,patchSizeY,numberOfPatches);
% till now random pathches are succesfully generated, without any error and
% its fast
% now time to perform the k-means
patches = reshape(patches,numberOfPatches,patchSizeX*patchSizeY*3);
tic;
[centers,mincenter,mindist,q2,quality] = fastkmeans(patches,numberOfCentroids);

%call the extractfeatures.m to create the new feature map from the input
%images and the centroids formed from the kmeans algo
%before passing the training data and the centers reshape the two inputs.

featureMap = extractFeatures(trainX,centers,patchSizeX,CIFAR_DIM,downsampleRate);



toc

