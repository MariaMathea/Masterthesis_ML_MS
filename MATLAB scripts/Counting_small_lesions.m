% Going through every image in path to check for small lesions

file_directory = dir('/home/maarhus/Documents/Master/data/MS_DATA/');


for i=3:length(file_directory)
    path = ['/home/maarhus/Documents/Master/data/MS_DATA/', file_directory(i).name];
    binary_image = niftiread([path, '/lesions_binarised.nii']);
 
    %Getting data on all connected components
    connected_components = bwconncomp(binary_image);

    %Get list of all lesions and the ids they contain
    pixel_list = connected_components.PixelIdxList;
    
    %Count and list to display
    count = 0;
    small_lesion_list = [];
    
    %Iterating through every lesion and checking its size
    for les = 1:length(pixel_list)
        lesion = pixel_list{les};
        les_size = length(lesion);
        if les_size <= 10
            count = count + 1;
            small_lesion_list(end+1) = les_size;
   
        end
    end
    
    %Displaying results
    fprintf('\n')
    string1 = ['The image in folder ', file_directory(i).name, ' contains ', num2str(count), ' small lesions'];
    disp(string1)
    
    fprintf('\n')
    string2 = ['The sizes of the lesions in folder ', file_directory(i).name,' are: ', num2str(small_lesion_list)];
    disp(string2)
end