# Master's Thesis Repository
A repository containing the code made during the master's thesis project titled **"Machine Learning in Automated Segmentation of Small Lesions in Magnetic Resonance Imaging for Multiple Sclerosis"**. The project involves using different machine learning approaches to automatically segment small multiple sclerosis lesions. Most of the models and algorithms used during the project have their own repositories/download requirements and will not be listed here.

The code residing in this repository is mostly functions that have been made for tasks performed before or after aquiring the model segmentations. The only exeption to this is the code made for the U-Net, and the nnU-Net utils that contain multiple functions that had to be used on the project dataset for it to be in the correct format for the nnU-Net to run, as well as aquire the probability maps.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Requirements](#requirements)
- [Usage](#usage)
- [Contact](#contact)


## Repository Structure
The code in this repository is organized into the following six folders:

**MATLAB scripts:** This folder contains MATLAB scripts that are used for working with the binary lesions. These scripts are primarily used for either calculating how many small lesions are within a binary image or for removing lesions of different sizes from an image. It also contains scripts that calculate the mean totall lesion volume and mean number of lesions in a dataset.

**Validation Pipeline:** The Validation Pipeline folder contains the code for the validation pipeline of the project. This pipeline is responsible for thresholding the probability maps outputted from each model. It also calculates the dice score to compare what threshold to use for each model.

**Testing Pipeline:** The Testing Pipeline folder contains the code for the testing pipeline of the project. This pipeline is responsible for producing the dice score, sensitivity and specificity metrics for the binary lesion segmentations. It produces individual scores for each subject in the test set, as well as mean scores. This is done for segmentations containing all lesions, and for the segmentations containing decreasing lesion sizes.

**Visualizations:** The Visualizations folder contains code related to visualizing the data or results of the project. This includes scripts for generating the segmentation overlap plots, barplots and lineplots present in the Results section of the thesis.

**U-Net:** The U-Net folder contains the implementation of the U-Net model. This deep learning architecture is accessed through the fastMONAI deep learning library. The code is built upon the "Binary Semantic Segmentation" tutorial from the fastMONAI website: https://fastmonai.no/tutorial_binary_segmentation.html    
The notebook goes through the steps of loading the data correctly, adding data augmentations, choosing learning rate, training and inference.

**nnU-Net Utils:** The nnU-Net Utils folder contains utility functions and scripts related to the nnU-Net framework. This framework is utilized for converting the project dataset into the correct format before training the nnU-Net, and to convert the output from inference into NIfTY images.


## Requirements
To run the code in this repository, the following software and libraries are required:

MATLAB (version R2022a or higher)\
Python (version 3.8.10 or higher)

**Python libraries:**
* fastAI (v2.7.10)
* fastMONAI (v0.3.0)
* jupyter (v1.0.0)
* nibabel (v4.0.2)
* pandas (v1.5.2)
* nnumpy (v1.23.5)
* pip (v20.0.2)
* pickleshare (v0.7.5)
* SimpleIKT (v2.2.0)
* Simplejson (v3.16.0)
* torch (v1.13.0)
* torchmetrics (v0.11.0)
* torchvision (v0.14.0)

The training of the U-Net should preferably be run on a **GPU** for less training time.\
For this project the code was run on the GPU: Alienware Nvidia 1080 GTX


## Usage
To use the code in this repository, follow the instructions below:

Clone this repository to your local machine using the following command:

```shell
git clone https://github.com/MariaMathea/Masterthesis_ML_MS.git
```


Explore the different folders based on your requirements:

**MATLAB scripts:** Execute the MATLAB scripts using MATLAB software.\
**Validation Pipeline:** Run the validation pipeline by executing the relevant cells in the script.\
**Testing Pipeline:** Run the testing pipeline by executing the relevant cells in the script.\
**Visualizations:** Execute the relevant cells to generate visual representations.\
**U-Net:** Utilize the U-Net implementation for training a segmentation model and performing inference.\
**nnU-Net Utils:** Use the utility functions and scripts provided to convert dataset to correct format before nnU-Net training/testing.

Make sure to adjust any necessary paths or parameters in the code files to suit your specific requirements.


## Contact
If you have any questions or need further assistance, feel free to contact me at marmka@live.com.
