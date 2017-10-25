#### General comments
* Please be more careful with the use of both “proof” (page 91) and “optimal” (pages 84, 100). “optimal” has to be put into context explaining the cost function and underlying assumptions; and “proof” should only ever be used when there is a formal proof of a theorem.
* Please be consistent with “E” and “I” notation for identity matrices.

#### Chapter 1: Introduction
* Please provide some more context around newer trends, specifically 3D generative models as well as deep learning along with some reasoning about why you have decided not to pursue these directions.

#### Chapter 2: Literature Review
* Page 18: “methodologies that that employ”: please correct.

#### Chapter 3: Basic Definitions and Notation
* Equation (3.12): Is there a reason for the order of variables to be the inverse of the shape model? If not, please make it consistent.

#### Chapter 4: Feature-based Lucas-Kanade and Active Appearance Models
* Please clarify that no image pyramid was used in this approach.
* Please give some details how you implemented solving the optimisation problem and how this relates to timings.

#### Chapter 5: Active Pictorial Structures

#### Chapter 6: Automatic Construction of Deformable Models
* Figure 6.2: Please clarify that the figure was taken from Stefanos’ paper.
* You claim that the IG features are better separating the PCA enabling the somewhat magical convergence of the automatic construction of the model. In our discussion, however, we found that it works just as well with SIFT. Please clarify, as otherwise the claim is misleading.

#### Chapter 7: Adaptive Cascaded Regression
* Page 117: “estimate of the shape parameters pk) that”: remove “)”.
* Section 7.2.3. How do you set the lambdas? Please explain.
* Why does [157] not appear in the graphs of the evaluation? It seems there is a wrong citation. Please correct.

#### Conclusion
* “with the gradient descent directions from Gauss-Newton optimization”: strictly speaking this is not gradient descent, since Gauss-Newton is a second order method... Please adjust.
