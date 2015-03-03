clc;
clear all;
close all;

%informatin about the dataset
imageSizeX = 32;
imageSizeY = 32;
patchSizeX = 6;
patchSizeY = 6;
numberOfPatches = 400000;

%load data from the datasets
fprintf('Loading training data...\n');
f1 = load('data_batch_1.mat');
f2 = load('data_batch_2.mat');
f3 = load('data_batch_3.mat');
f4 = load('data_batch_4.mat');
f5 = load('data_batch_5.mat');


trainX = double([f1.data;f2.data;f3.data;f4.data;f5.data]);
labels = double([f1.labels;f2.labels;f3.labels;f4.labels;f5.labels]);
clear f1 f2 f3 f4 f5; % clear the stored variables form the memory

numberOfImages = size(trainX,1);
trainX = reshape(trainX,numberOfImages,imageSizeX*imageSizeY,3);

patches = generateRandomPatch(trainX,imageSizeX,imageSizeY,patchSizeX,patchSizeY,numberOfPatches);
% till now random pathches are succesfully generated, without any error and
% its fast
% now time to perform the k-means


