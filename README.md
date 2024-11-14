# ML-based Image Classifer

The objective of this pipeline is to quantify categories of phenotypes of single nuclei based on Confocal Imaging data using ML-based approaches.

Briefly, the steps in the pipeline is as follows:

1) Use FIJI macro to crop out images of single nuclei from a large field of view based on DAPI signals and thresholds of GFP. Store relevant channels corresponding to MSL2/3. (credits: Dr. Andreas Thomae, modified by MuhundenJ)
2) Manually annotate a subset of data as training data with class labels -> Drag images of a particular category (ex- territories) into a folder and batch rename files using rename.sh (Blinding during annotation is recommended!)
3) Load and calculate Grey Level Co-occurence Matrix (GLCM) features representing textural properties using EBImage R package. Perform prelim dimensionality reduction visualizations to get a sense of variation in the data. Preprocess data and train tuned ML models (Logistic Regression with Elastic Nets, Support Vector Machines and Gradient Boosted Decision Trees were compared) using TidyModels package. A simple Deep Learning implementation (CNN) was also tested using TensorFlow on R. Select best model, classify and quantify phenotypes of unlabelled nuclei from whole dataset across different genotypes. 

Summary of entire project is available on 'ImageClassifier v3' RMarkdown file (see preview in below link)
https://html-preview.github.io/?url=https://github.com/MuhundenJ/ML_ImageClassifier/blob/master/ImageClassifier_v3.html

