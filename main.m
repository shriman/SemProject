clc;
clear all;
close all;
%informatin about the dataset
imageSizeX = 32;
imageSizeY = 32;
patchSizeX = 6;
patchSizeY = 6;
numberOfPatches = 100;

%load data from the datasets
f1 = load('data_batch_1.mat');
f2 = load('data_batch_2.mat');
f3 = load('data_batch_3.mat');

trainX = double([f1.data;f2.data;f3.data]);
labels = double([f1.labels;f2.labels;f3.labels]);
numberOfImages = size(trainX,1);
trainX = reshape(trainX,numberOfImages,imageSizeX*imageSizeY,3);

patches = generateRandomPatch(trainX,imageSizeX,imageSizeY,patchSizeX,patchSizeY,100);

