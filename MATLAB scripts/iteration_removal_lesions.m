%Removing all lesions bigger than 10 voxels

file_directory = dir('/home/maarhus/Documents/Master/bwconncomp/nnUnet/prob_map_folder/');


for i=3:length(file_directory)
    path = ['/home/maarhus/Documents/Master/bwconncomp/nnUnet/prob_map_folder/', file_directory(i).name];
    binary_image = niftiread([path, '/nnunet_thr_0.5_map.nii']);
    info = niftiinfo([path, '/nnunet_thr_0.5_map.nii']);

    %Getting data on all connected components
    connected_components = bwconncomp(binary_image);

    %Get list of all lesions and the ids they contain
    pixel_list = connected_components.PixelIdxList;

    %Iterating through every lesion and checking its size
    for les = 1:length(pixel_list)
        lesion = pixel_list{les};
        les_size = length(lesion);
        if les_size > 10

            %Erase lesion
            binary_image(lesion) = 0;
        else
            disp(les_size)
        end
    end

    %Save image where large lesions are removes
    niftiwrite(binary_image, [path, '/lesions_removed_size10'], info);
end
