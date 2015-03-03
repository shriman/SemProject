function patches = generateRandomPatch(images,imageSizeX, imageSizeY, patchSizeX,patchSizeY,numberOfPatches)
   %this function is used to generate the patches from the input images
   %assuming 'images' is a 3d matrix of images withimages on rows and  R G
   %B channels as rows in Z-dimension
   numberOfImages = size(images,1);
   pos = floor(numberOfImages*(rand(numberOfPatches,1))) + 1;
  
   patch = images(pos,:,:);
   patches = zeros(numberOfPatches,patchSizeX*patchSizeY,3);
   
   for i =1:1:numberOfPatches
       if (mod(i,10000) == 0) 
           fprintf('Extracting patch: %d / %d\n', i, numberOfPatches);
       end
       
       red = reshape(patch(i,:,1),imageSizeX,imageSizeY);
       green = reshape(patch(i,:,2),imageSizeX,imageSizeY);
       blue = reshape(patch(i,:,3),imageSizeX,imageSizeY);
       
       posX = floor((imageSizeX - patchSizeX)*rand(1)) + 1;
       posY = floor((imageSizeY - patchSizeY)*rand(1)) + 1;
        
       patchRed = red(posX:posX+patchSizeX-1,posY:posY+patchSizeY-1);
       patchGreen = green(posX:posX+patchSizeX-1,posY:posY+patchSizeY-1);
       patchBlue = blue(posX:posX+patchSizeX-1,posY:posY+patchSizeY-1);
       
       patchRed = reshape(patchRed,1,patchSizeX*patchSizeY);
       patchGreen = reshape(patchGreen,1,patchSizeX*patchSizeY);
       patchBlue = reshape(patchBlue,1,patchSizeX*patchSizeY);
       
       patches(i,:,1) = patchRed;
       patches(i,:,2) = patchGreen;
       patches(i,:,3) = patchBlue;
       
   end
   
   s
end