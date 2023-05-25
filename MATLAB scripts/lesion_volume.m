% Calculating mean number of lesions and mean lesion size 


file_directory = dir('/home/maarhus/Documents/Master/data/MS_DATA_TEST/');

%Lists to save lesion volume and number of lesions
tvl_list = [];
num_les_list = [];

for i=3:length(file_directory)
    path = ['/home/maarhus/Documents/Master/data/MS_DATA_TEST/', file_directory(i).name];
    binary_image = niftiread([path, '/lesions_binarised.nii']);

    %Getting data on all connected components
    connected_components = bwconncomp(binary_image);

    %Get list of all lesions and the ids they contain
    pixel_list = connected_components.PixelIdxList;

    %Keep track of values
    tvl = 0;
    num_les = 0;
    les_list = [];

    %Iterating through every lesion and saving its volume
    for les = 1:length(pixel_list)
        lesion = pixel_list{les};
        les_size = length(lesion);

        tvl = tvl + les_size;
        num_les = num_les + 1;
        les_list(end+1) = les_size;

    end

    tvl_list(end+1) = tvl;
    num_les_list(end + 1) = num_les;

    %Displaying information
    name = ['Lesion sizes for:', file_directory(i).name];
    disp(name)
    tvl_disp = ['TVL: ', num2str(tvl)];
    disp(tvl_disp)
    list_disp = ['All lesion sizes: ', string(les_list)];
    disp(list_disp)
end

%Calculating and displaying mean number of lesions
mean_num = mean2(num_les_list);
thing2 = ['Mean number of lesions: ', num2str(mean_num)];
disp(thing2)

%Calculating and displaying mean lesion volume
mean_tvl = mean2(tvl_list);
thing = ['Mean tvl: ', num2str(mean_tvl)];
disp(thing)
