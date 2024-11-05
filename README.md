# Progetto 2
## Recognition of Faces Generated Using Taming Transformers
A recent method for image generation, called Taming Transformers[1], is capable of producing highly realistic synthetic faces that can be difficult to distinguish from natural ones (see Figure 1). Unfortunately, there are many improper uses for such images, making it essential to develop reliable detection methods [3, 2].

The objective of this project is to develop a technique for determining whether a face image is real or generated. In this project, you will adopt a fine-tuning strategy using the pre-trained Xception architecture on ImageNet. The steps involved in this project are as follows:

1.Dataset Creation: Create a dataset containing 3,000 original face images and 3,000 synthetic face images. You can download the original faces by running the following command in Colab:
!wget --user=corso --password=p2021corso http://www.grip.unina.it/download/corso/ffhq_real.zip
Resize all original faces to 256x256 pixels. For generating 3,000 synthetic face images, use the Taming Transformers method<sup>1</sup> code.

2.Data Preparation: Split the images into three sets, with 66.6% for training, 16.7% for validation, and 16.7% for testing. Prepare the data for binary classification (real vs. synthetic) using Keras's ImageDataGenerator function with the flow_from_directory method. For all sets, normalize the images to the range [-1, 1] and center-crop them to 224 × 224 pixels. For the training set only, apply the following data augmentation techniques: random rotations by multiples of 90 degrees and Gaussian blurring with a sigma in the range [0.0, 3.0]. Use the preprocessing_function parameter in ImageDataGenerator to implement these operations.

3.Architecture: Define the architecture using Keras’s Xception function with an input size of 224 × 224 pixels.

4.Training: Use the Adam optimizer for training through Keras’s keras.optimizers.Adam function and Cross-Entropy for the loss function. Rely on performance on the validation set to select optimal values for learning rate, batch size, number of epochs, and the number of layers to freeze in the network.

5.Performance Evaluation: Use the test set to evaluate performance in terms of AUC (Area Under ROC Curve) for each GAN and apply sklearn.metrics.roc_auc_score for this purpose.


<sup>1</sup>https://github.com/CompVis/taming-transformers

## References
[1] P. Esser, R. Robin, and B. Ommer, “Taming transformers for high-resolution image synthesis,” IEEE
Conference on Computer Vision and Pattern Recognition (CVPR), 2021.

[2] D. Gragnaniello, D. Cozzolino, F. Marra, G. Poggi, and L. Verdoliva, “Are GAN generated images easy
to detect? A critical analysis of the state-of-the-art,” IEEE International Conference on Multimedia &
Expo (ICME), 2021.

[3] S.-Y. Wang, O. Wang, R. Zhang, A. Owens, and A. Efros, “CNN-generated images are surprisingly
easy to spot... for now,” IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2020.

# Misc
Dataset originale: https://github.com/NVlabs/ffhq-dataset
