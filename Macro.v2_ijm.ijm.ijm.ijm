setBatchMode(true);
input = "/Users/ra36doj/Desktop/mount/DeepLearning/ImageClassifier/ImageCropper/";
output = "/Users/ra36doj/Desktop/mount/DeepLearning/ImageClassifier/out/";
list = getFileList(input);

for (i = 0; i < list.length; i++){
        //print(input + list[i]);
        open(input + list[i]);
        mainTitle=getTitle();
        dirCropOutput=output+File.separator+mainTitle;
        File.makeDirectory(dirCropOutput);     
        run("Duplicate...", "title=particles");
        run("8-bit");
        selectWindow("particles");
        run("Auto Threshold", "method=Default");
        setOption("BlackBackground", false);
        run("Convert to Mask", "method=Default background=Default calculate");
        run("Analyze Particles...", "size=1-Infinity circularity=0.5-1.0 display exclude clear add slice");
        selectWindow("Results");
        saveAs("Results", dirCropOutput+File.separator+"Results.xls");
        run("Close");
        selectWindow(mainTitle);

        for (u=0; u<roiManager("count"); ++u) {
            run("Duplicate...", "title=crop duplicate channels=3");
            roiManager("Select", u);
            run("To Bounding Box");
            run("Specify...", "width=20 height=20 centered");
            //run("Enlarge...", "enlarge=2");
            run("Crop");
            saveAs("Tiff", dirCropOutput+File.separator+"The_Particle_"+(u+1)+".tif");
            close();
             //Next round!
             selectWindow(mainTitle);
        }
        close();
        selectWindow("particles");
        close();
        //print("finished");    
}
