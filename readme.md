# woundaries
A Matlab GUI to calculate area and other geometric estimators of wound from digitized hand-traced planimetries. 
Two sliders must be iteratively adjusted to match the wound outline. Calibration can be obtained from the underlying grid. 

## Reference
Please cite the publication below in all your documents and manuscripts that made use of the software included in this repository.
> #### A toolkit for the quantitative evaluation of chronic wounds evolution for early detection of non-healing wounds
> ###### Cullell-Dalmau, M., Otero-Viñas, M., Ferrer-Solà, M., Sureda-Vidal, H., and Manzo, C.
> ###### *Journal of Tissue Viability* (2021)
> ###### doi: 10.1016/j.jtv.2021.02.009
> ###### [Link to Journal of Tissue Viability](https://www.sciencedirect.com/science/article/abs/pii/S0965206X21000279)

#### *BibTeX*
```
@article{cullell2021toolkit,
  title={A toolkit for the quantitative evaluation of chronic wounds evolution for early detection of non-healing wounds},
  author={Cullell-Dalmau, Marta and Otero-Vi{\~n}as, Marta and Ferrer-Sol{\`a}, Marta and Sureda-Vidal, Helena and Manzo, Carlo},
  journal={Journal of Tissue Viability},
  year={2021},
  publisher={Elsevier}
}
```
### Prerequisites
Matlab 2013a (The Mathworks Inc., www.mathworks,com) or later.

### Running the code
Run woundaries.m in Matlab. The initialized GUI will open. 

### Load data
By pushing the "Load" button, a window will pop up asking to choose the image file to be loaded. An example file ('example.jpg') is provided. The loaded image will appear in a separate window and the software will wait for the user  to draw a rectangle around the area of interest and then double click.

!["The ROI selection"](popup.png)

### Adjusting the sliders
The image and the estimated boundaries and area will then appear in the main window. The two sliders can be interactively adjusted to fill gaps in the contour and provide a reliable estimation of the wound area.
 Clicking the "Measure" button will provide the quantification of geometric estimators. If a calibration is not provided, dimensional estimators will be given in pixels.

!["The woundaries GUI"](woundaries.png)

### Area calibration
By pushing the "Calibrate" button, a window will pop up allowing to select the area of the grid corresponding to a square centimeter. Once this operation is performed, the software will automatically calculate the geometric estimators of the wound in the correct units.

### Save output
Clicking the "Save output" button generates a *.txt file containing the results of the measures.
