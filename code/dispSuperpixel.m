function outputImage = dispSuperpixel(img, L, N, is_meanRegion, scale)

% img, L, is_meanRegion
boundaryMsk = boundarymask(imresize(L, scale,'nearest'));
img_scale = imresize(img, scale,'nearest');
figure; imshow(imoverlay(img_scale, boundaryMsk, 'm'), 'InitialMagnification', 100);
imwrite(imoverlay(img_scale, boundaryMsk, 'm'),'/csuperpixel_c079.bmp');

if is_meanRegion
    outputImage = zeros(size(img),'like',img);
    idx = label2idx(L);
    for labelVal = 1:N
        labelIdx = idx{labelVal};
        outputImage(labelIdx) = mean(img(labelIdx));
    end
    figure; imshow(outputImage,'InitialMagnification',scale * 100)
end  
    
end