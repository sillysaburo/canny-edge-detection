function [edges] = getTemplate()
[FileName, FilePath] = uigetfile('*');
input_image = imread(strcat(FilePath,FileName));
%numcolors = 3;
imshow(input_image)
title('input')
[height, width, numlayers]=size(input_image);
if numlayers == 3
    layer_image=input_image(:,:,1);
    double_image = double(layer_image);
    figure; imshow(layer_image);
    title('Layer Image');
else
    double_image = doube(input_image);
    figure; imshow(double_image);
end

title('Double Image');
[gxy, iangle] = MagnitudeGradient(double_image);
[suppressed] = NonMaxSuppression(gxy, iangle);
[hysteresis] = Hysteresis(suppressed);
[edges] = edge_linking(hysteresis);
%[chamfer] = Chamfer(edges);
end

