#Data obtained from http://hbiostat.org/data courtesy of the Vanderbilt University Department of Biostatistics.


bodyfat_data<-read.csv("C:/Users/enrag/Documents/Mock Data Analytics/Bodyfat_Data/bodyfat.csv",header=T)

#For this one, we're going to try to find a Multiple Regression formula for Body Fat percentage
#based on multiple measurements taken.

shapiro.test(bodyfat_data$BodyFat)
#W = 0.99168, p-value = 0.1649

shapiro.test(bodyfat_data$Density)
#W = 0.9954, p-value = 0.6571

shapiro.test(bodyfat_data$Age)
#W = 0.97946, p-value = 0.001043

shapiro.test(bodyfat_data$Weight)
#W = 0.94137, p-value = 1.709e-08


summary(lm(BodyFat~.,data=bodyfat_data))

#Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  4.500e+02  1.071e+01  42.005   <2e-16 ***
#Density     -4.112e+02  8.258e+00 -49.796   <2e-16 ***
#Age          1.259e-02  9.626e-03   1.308    0.192    
#Weight       1.005e-02  1.597e-02   0.630    0.529    
#Height      -7.981e-03  2.844e-02  -0.281    0.779    
#Neck        -2.846e-02  6.938e-02  -0.410    0.682    
#Chest        2.678e-02  2.936e-02   0.912    0.363    
#Abdomen      1.857e-02  3.175e-02   0.585    0.559    
#Hip          1.917e-02  4.343e-02   0.441    0.659    
#Thigh       -1.676e-02  4.303e-02  -0.389    0.697    
#Knee        -4.639e-03  7.162e-02  -0.065    0.948    
#Ankle       -8.568e-02  6.576e-02  -1.303    0.194    
#Biceps      -5.505e-02  5.087e-02  -1.082    0.280    
#Forearm      3.386e-02  5.953e-02   0.569    0.570    
#Wrist        7.345e-03  1.617e-01   0.045    0.964    
#---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 1.274 on 237 degrees of freedom
#Multiple R-squared:  0.9781,	Adjusted R-squared:  0.9768 
#F-statistic: 756.3 on 14 and 237 DF,  p-value: < 2.2e-16

#None of the variables sans Density seem significan
AIC(lm(BodyFat~.,data=bodyfat_data))
#853.8515

BIC(lm(BodyFat~.,data=bodyfat_data))
#910.3223

#let's try removing Knee and Wrist Measurements
summary(lm(BodyFat~Density+Age+Weight+Height+
  Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  4.499e+02  1.056e+01  42.611   <2e-16 ***
#Density     -4.112e+02  8.054e+00 -51.053   <2e-16 ***
#Age          1.258e-02  8.575e-03   1.467    0.144    
#Weight       9.878e-03  1.523e-02   0.648    0.517    
#Height      -8.030e-03  2.809e-02  -0.286    0.775    
#Neck        -2.710e-02  6.619e-02  -0.409    0.683    
#Chest        2.691e-02  2.911e-02   0.924    0.356    
#Abdomen      1.868e-02  3.157e-02   0.592    0.554    
#Hip          1.905e-02  4.321e-02   0.441    0.660    
#Thigh       -1.756e-02  4.119e-02  -0.426    0.670    
#Ankle       -8.568e-02  6.222e-02  -1.377    0.170    
#Biceps      -5.469e-02  5.044e-02  -1.084    0.279    
#Forearm      3.403e-02  5.776e-02   0.589    0.556

#Residual standard error: 1.269 on 239 degrees of freedom
#Multiple R-squared:  0.9781,	Adjusted R-squared:  0.977 
#F-statistic: 889.8 on 12 and 239 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Age+Weight+Height+
         Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#849.8577

BIC(lm(BodyFat~Density+Age+Weight+Height+
         Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#899.2697


#remove height
summary(lm(BodyFat~Density+Age+Weight+
             Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#Coefficients:
#               Estimate Std. Error t value Pr(>|t|)    
#Intercept)   4.491e+02  1.020e+01  44.016   <2e-16 ***
#Density     -4.113e+02  8.022e+00 -51.275   <2e-16 ***
#Age          1.277e-02  8.531e-03   1.497    0.136    
#Weight       7.683e-03  1.313e-02   0.585    0.559    
#Neck        -2.669e-02  6.605e-02  -0.404    0.686    
#Chest        2.882e-02  2.829e-02   1.019    0.309    
#Abdomen      1.930e-02  3.143e-02   0.614    0.540    
#Hip          2.218e-02  4.171e-02   0.532    0.595    
#Thigh       -1.540e-02  4.042e-02  -0.381    0.704    
#Ankle       -8.532e-02  6.209e-02  -1.374    0.171    
#Biceps      -5.401e-02  5.029e-02  -1.074    0.284    
#Forearm      3.381e-02  5.765e-02   0.587    0.558

#Residual standard error: 1.267 on 240 degrees of freedom
#Multiple R-squared:  0.9781,	Adjusted R-squared:  0.9771 
#F-statistic: 974.4 on 11 and 240 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Age+Weight+
         Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#847.9438

BIC(lm(BodyFat~Density+Age+Weight+
         Neck+Chest+Abdomen+Hip+Thigh+Ankle+Biceps+Forearm,data=bodyfat_data))
#893.8264


summary(lm(BodyFat~Density+Age+Weight+
             Chest+Neck+Abdomen+Hip+Ankle+Biceps+Forearm,data=bodyfat_data))
#Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  4.486e+02  1.008e+01  44.496   <2e-16 ***
#Density     -4.109e+02  7.923e+00 -51.861   <2e-16 ***
#Age          1.393e-02  7.962e-03   1.749   0.0816 .  
#Weight       7.346e-03  1.308e-02   0.562   0.5748    
#Chest        3.041e-02  2.792e-02   1.089   0.2772    
#Neck        -2.885e-02  6.569e-02  -0.439   0.6609    
#Abdomen      1.885e-02  3.135e-02   0.601   0.5483    
#Hip          1.542e-02  3.768e-02   0.409   0.6827    
#Ankle       -8.599e-02  6.195e-02  -1.388   0.1664    
#Biceps      -5.892e-02  4.853e-02  -1.214   0.2259    
#Forearm      3.355e-02  5.754e-02   0.583   0.5604 

#Residual standard error: 1.264 on 241 degrees of freedom
#Multiple R-squared:  0.9781,	Adjusted R-squared:  0.9772 
#F-statistic:  1076 on 10 and 241 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Age+Weight+
         Chest+Neck+Abdomen+Hip+Ankle+Biceps+Forearm,data=bodyfat_data))
#846.0963

BIC(lm(BodyFat~Density+Age+Weight+
         Chest+Neck+Abdomen+Hip+Ankle+Biceps+Forearm,data=bodyfat_data))
#888.4494


summary(lm(BodyFat~Density+Age,data=bodyfat_data))

#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  4.747e+02  4.834e+00  98.196   <2e-16 ***
#Density     -4.321e+02  4.491e+00 -96.221   <2e-16 ***
#Age          1.239e-02  6.781e-03   1.826    0.069 . 

#Residual standard error: 1.301 on 249 degrees of freedom
#Multiple R-squared:  0.976,	Adjusted R-squared:  0.9758 
#F-statistic:  5071 on 2 and 249 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Age,data=bodyfat_data))
#852.639
BIC(lm(BodyFat~Density+Age,data=bodyfat_data))
#866.7567

#Trying Two Way Interactions
summary(lm(BodyFat~.^2,data=bodyfat_data))
#Coefficients:
#                  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)     -6.009e+02  7.372e+02  -0.815  0.41635    
#Density          5.439e+02  6.361e+02   0.855  0.39397    
#Age              1.899e+00  1.220e+00   1.557  0.12173    
#Weight          -5.895e+00  2.083e+00  -2.831  0.00530 ** 
#Height           8.450e-01  6.428e+00   0.131  0.89559    
#Neck             9.750e+00  1.079e+01   0.904  0.36748    
#Chest           -1.449e+00  3.448e+00  -0.420  0.67488    
#Abdomen          7.010e+00  2.678e+00   2.617  0.00979 ** 
#Hip              4.913e+00  6.263e+00   0.784  0.43403    
#Thigh            1.166e+01  6.603e+00   1.766  0.07944 .  
#Knee            -1.788e+01  1.098e+01  -1.628  0.10570    
#Ankle            3.486e+01  1.057e+01   3.298  0.00122 ** 
#Biceps           2.055e+01  7.086e+00   2.900  0.00431 ** 
#Forearm          3.402e+00  1.164e+01   0.292  0.77050    
#Wrist           -4.983e+01  2.449e+01  -2.035  0.04370 *  
#Density:Age     -1.058e+00  9.546e-01  -1.108  0.26961    
#Density:Weight   4.728e+00  1.841e+00   2.568  0.01123 *  
#Density:Height  -1.250e+00  5.426e+00  -0.230  0.81817    
#Density:Neck    -5.450e+00  7.463e+00  -0.730  0.46637    
#Density:Chest    4.850e-01  2.767e+00   0.175  0.86109    
#Density:Abdomen -5.946e+00  2.049e+00  -2.902  0.00428 ** 
#Density:Hip     -2.159e+00  4.774e+00  -0.452  0.65171    
#Density:Thigh   -1.287e+01  4.785e+00  -2.689  0.00800 ** 
#Density:Knee     1.942e+01  8.010e+00   2.424  0.01657 *  
#Density:Ankle   -3.174e+01  8.997e+00  -3.528  0.00056 ***
#Density:Biceps  -1.227e+01  5.284e+00  -2.321  0.02166 *  
#Density:Forearm -3.305e+00  8.373e+00  -0.395  0.69367    
#Density:Wrist    2.646e+01  1.686e+01   1.570  0.11860    
#Age:Weight       2.945e-03  2.166e-03   1.360  0.17603    
#Age:Height      -6.033e-03  5.868e-03  -1.028  0.30552    
#Age:Neck        -1.050e-03  7.778e-03  -0.135  0.89282    
#Age:Chest       -1.594e-03  3.356e-03  -0.475  0.63540    
#Age:Abdomen     -6.124e-03  3.080e-03  -1.988  0.04863 *  
#Age:Hip          2.811e-03  5.736e-03   0.490  0.62481    
#Age:Thigh       -1.187e-04  4.275e-03  -0.028  0.97788    
#Age:Knee         8.276e-03  6.684e-03   1.238  0.21765    
#Age:Ankle       -3.807e-02  9.319e-03  -4.085 7.24e-05 ***
#Age:Biceps      -1.505e-02  6.580e-03  -2.287  0.02361 *  
#Age:Forearm     -6.648e-03  7.971e-03  -0.834  0.40560    
#Age:Wrist        4.709e-02  1.482e-02   3.178  0.00181 ** 
#Weight:Height    3.691e-03  6.705e-03   0.550  0.58283    
#Weight:Neck      9.574e-03  1.586e-02   0.604  0.54698    
#Weight:Chest     1.126e-03  3.994e-03   0.282  0.77837    
#Weight:Abdomen  -2.224e-03  5.190e-03  -0.428  0.66895    
#Weight:Hip       9.637e-03  7.752e-03   1.243  0.21584    
#Weight:Thigh    -8.679e-03  1.114e-02  -0.779  0.43702    
#Weight:Knee      2.205e-02  2.281e-02   0.967  0.33537    
#Weight:Ankle    -2.553e-02  2.227e-02  -1.146  0.25353    
#Weight:Biceps    9.008e-03  1.200e-02   0.751  0.45404    
#Weight:Forearm  -4.697e-03  1.587e-02  -0.296  0.76769    
#Weight:Wrist    -3.349e-02  4.674e-02  -0.717  0.47482    
#Height:Neck     -1.399e-02  4.692e-02  -0.298  0.76602    
#Height:Chest     1.432e-02  1.382e-02   1.037  0.30150    
#Height:Abdomen   2.909e-03  1.763e-02   0.165  0.86921    
#Height:Hip      -2.156e-02  2.304e-02  -0.936  0.35094    
#Height:Thigh     2.011e-02  2.700e-02   0.745  0.45763    
#Height:Knee     -1.193e-02  5.138e-02  -0.232  0.81665    
#Height:Ankle     1.754e-02  6.383e-02   0.275  0.78390    
#Height:Biceps   -4.832e-02  3.451e-02  -1.400  0.16361    
#Height:Forearm   6.373e-03  6.183e-02   0.103  0.91805    
#Height:Wrist     7.168e-02  1.260e-01   0.569  0.57022    
#Neck:Chest      -9.872e-03  2.748e-02  -0.359  0.71993    
#Neck:Abdomen    -8.916e-03  2.873e-02  -0.310  0.75673    
#Neck:Hip        -9.835e-04  3.601e-02  -0.027  0.97825    
#Neck:Thigh       1.244e-02  3.178e-02   0.391  0.69600    
#Neck:Knee        1.181e-02  6.516e-02   0.181  0.85638    
#Neck:Ankle      -2.577e-03  8.122e-02  -0.032  0.97473    
#Neck:Biceps     -8.268e-02  4.816e-02  -1.717  0.08813 .  
#Neck:Forearm    -4.530e-03  6.830e-02  -0.066  0.94721    
#Neck:Wrist      -6.191e-02  1.444e-01  -0.429  0.66869    
#Chest:Abdomen    7.010e-03  9.182e-03   0.763  0.44643    
#Chest:Hip       -1.737e-02  1.377e-02  -1.261  0.20915    
#Chest:Thigh      1.878e-02  1.432e-02   1.311  0.19179    
#Chest:Knee      -2.877e-02  3.199e-02  -0.900  0.36985    
#Chest:Ankle      2.186e-02  4.338e-02   0.504  0.61511    
#Chest:Biceps    -2.597e-02  2.000e-02  -1.298  0.19630    
#Chest:Forearm    1.313e-02  3.155e-02   0.416  0.67774    
#Chest:Wrist      6.614e-02  7.037e-02   0.940  0.34884    
#Abdomen:Hip     -6.479e-03  1.700e-02  -0.381  0.70363    
#Abdomen:Thigh   -2.771e-02  1.672e-02  -1.658  0.09952 .  
#Abdomen:Knee     3.118e-02  3.021e-02   1.032  0.30380    
#Abdomen:Ankle    1.873e-02  3.414e-02   0.549  0.58417    
#Abdomen:Biceps  -1.041e-02  1.995e-02  -0.522  0.60273    
#Abdomen:Forearm  3.798e-02  3.575e-02   1.062  0.28981    
#Abdomen:Wrist   -3.923e-02  6.877e-02  -0.571  0.56919    
#Hip:Thigh        1.562e-02  2.339e-02   0.668  0.50540    
#Hip:Knee        -4.095e-02  3.394e-02  -1.207  0.22956    
#Hip:Ankle       -4.990e-02  5.565e-02  -0.897  0.37139    
#Hip:Biceps       7.004e-04  2.718e-02   0.026  0.97948    
#Hip:Forearm     -3.577e-02  4.089e-02  -0.875  0.38308    
#Hip:Wrist        1.229e-01  9.703e-02   1.267  0.20734    
#Thigh:Knee       1.856e-02  3.305e-02   0.561  0.57536    
#Thigh:Ankle     -2.080e-02  5.461e-02  -0.381  0.70386    
#Thigh:Biceps    -1.168e-02  2.588e-02  -0.451  0.65247    
#Thigh:Forearm   -9.194e-03  4.215e-02  -0.218  0.82763    
#Thigh:Wrist      6.130e-02  9.746e-02   0.629  0.53032    
#Knee:Ankle       3.223e-02  9.780e-02   0.330  0.74219    
#Knee:Biceps      2.638e-02  4.951e-02   0.533  0.59493    
#Knee:Forearm    -4.138e-02  8.165e-02  -0.507  0.61310    
#Knee:Wrist      -2.238e-01  1.499e-01  -1.493  0.13768    
#Ankle:Biceps    -3.088e-02  6.375e-02  -0.484  0.62879    
#Ankle:Forearm    5.675e-02  9.012e-02   0.630  0.52989    
#Ankle:Wrist      2.305e-01  1.552e-01   1.485  0.13963    
#Biceps:Forearm  -3.187e-02  4.085e-02  -0.780  0.43661    
#Biceps:Wrist     1.558e-01  1.113e-01   1.399  0.16380    
#Forearm:Wrist    8.465e-02  1.489e-01   0.568  0.57059 

#Residual standard error: 0.85 on 146 degrees of freedom
#Multiple R-squared:  0.994,	Adjusted R-squared:  0.9897 
#F-statistic: 230.4 on 105 and 146 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~.^2,data=bodyfat_data))
#709.6659 
BIC(lm(BodyFat~.^2,data=bodyfat_data))
#1087.315



summary(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
  Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
  Density:Knee+Density:Ankle+Density:Biceps+Age:Abdomen+
  Age:Ankle+Age:Biceps+Age:Wrist+Neck:Biceps+Abdomen:Thigh
  ,data=bodyfat_data))
#Coefficients:
#                  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)     -2.426e+02  1.158e+02  -2.095  0.03726 *  
#Density          2.524e+02  1.064e+02   2.372  0.01850 *  
#Weight          -3.738e+00  4.320e-01  -8.653 8.48e-16 ***
#Abdomen          4.842e+00  7.739e-01   6.257 1.87e-09 ***
#Thigh            3.945e+00  1.843e+00   2.141  0.03331 *  
#Ankle            2.091e+01  4.473e+00   4.675 5.00e-06 ***
#Biceps           6.643e+00  2.438e+00   2.724  0.00693 ** 
#Wrist           -1.061e+00  3.654e-01  -2.904  0.00404 ** 
#Density:Weight   3.564e+00  4.092e-01   8.711 5.78e-16 ***
#Density:Abdomen -4.538e+00  7.257e-01  -6.254 1.91e-09 ***
#Density:Thigh   -3.813e+00  1.704e+00  -2.238  0.02619 *  
#Density:Knee    -2.797e-02  6.238e-02  -0.448  0.65430    
#Density:Ankle   -1.939e+01  4.114e+00  -4.713 4.21e-06 ***
#Density:Biceps  -6.400e+00  2.255e+00  -2.839  0.00493 ** 
#Abdomen:Age     -1.350e-03  9.051e-04  -1.491  0.13723    
#Ankle:Age       -1.153e-02  4.278e-03  -2.696  0.00754 ** 
#Biceps:Age       1.597e-03  2.935e-03   0.544  0.58683    
#Wrist:Age        1.958e-02  6.758e-03   2.898  0.00412 ** 
#Biceps:Neck      8.405e-04  1.829e-03   0.459  0.64637    
#Abdomen:Thigh    5.284e-04  1.361e-03   0.388  0.69812  

#Residual standard error: 1.109 on 232 degrees of freedom
#Multiple R-squared:  0.9838,	Adjusted R-squared:  0.9825 
#F-statistic: 740.6 on 19 and 232 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
         Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
         Density:Knee+Density:Ankle+Density:Biceps+Age:Abdomen+
         Age:Ankle+Age:Biceps+Age:Wrist+Neck:Biceps+Abdomen:Thigh
       ,data=bodyfat_data))
#788.2772

BIC(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
         Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
         Density:Knee+Density:Ankle+Density:Biceps+Age:Abdomen+
         Age:Ankle+Age:Biceps+Age:Wrist+Neck:Biceps+Abdomen:Thigh
       ,data=bodyfat_data))
#862.3952




summary(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
             Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
             Density:Ankle+Density:Biceps+
             Age:Ankle+Age:Wrist
           ,data=bodyfat_data))
#Coefficients:
#                  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)     -2.679e+02  9.710e+01  -2.759  0.00624 ** 
#Density          2.721e+02  9.201e+01   2.957  0.00342 ** 
#Weight          -3.620e+00  4.116e-01  -8.794 3.03e-16 ***
#Abdomen          4.313e+00  6.812e-01   6.332 1.21e-09 ***
#Thigh            4.943e+00  1.595e+00   3.100  0.00217 ** 
#Ankle            2.059e+01  4.230e+00   4.867 2.07e-06 ***
#Biceps           6.657e+00  2.265e+00   2.939  0.00362 ** 
#Wrist           -8.174e-01  2.957e-01  -2.764  0.00616 ** 
#Density:Weight   3.450e+00  3.906e-01   8.833 2.33e-16 ***
#Density:Abdomen -4.063e+00  6.480e-01  -6.270 1.70e-09 ***
#Density:Thigh   -4.709e+00  1.515e+00  -3.108  0.00211 ** 
#Density:Ankle   -1.912e+01  3.900e+00  -4.904 1.75e-06 ***
#Density:Biceps  -6.311e+00  2.135e+00  -2.956  0.00343 ** 
#Ankle:Age       -1.075e-02  4.015e-03  -2.678  0.00792 ** 
#Wrist:Age        1.459e-02  5.077e-03   2.873  0.00443 **

#Residual standard error: 1.104 on 237 degrees of freedom
#Multiple R-squared:  0.9836,	Adjusted R-squared:  0.9826 
#F-statistic:  1013 on 14 and 237 DF,  p-value: < 2.2e-16

AIC(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
         Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
         Density:Ankle+Density:Biceps+
         Age:Ankle+Age:Wrist
       ,data=bodyfat_data))
#781.5134

BIC(lm(BodyFat~Density+Weight+Abdomen+Thigh+Ankle+Biceps+
         Wrist+Density:Weight+Density:Abdomen+Density:Thigh+
         Density:Ankle+Density:Biceps+
         Age:Ankle+Age:Wrist
       ,data=bodyfat_data))
#837.9843


summary(lm(BodyFat~Weight+Abdomen+Ankle+Density:Weight+
    Density:Abdomen+Density:Ankle,data=bodyfat_data))

#Coefficients:
#                Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      15.8983     1.7236   9.224  < 2e-16 ***
#Weight           -2.2851     0.2396  -9.537  < 2e-16 ***
#Abdomen           4.3069     0.5939   7.252 5.37e-12 ***
#Ankle            19.1773     1.4834  12.928  < 2e-16 ***
#Weight:Density    2.1706     0.2274   9.545  < 2e-16 ***
#Abdomen:Density  -4.0301     0.5650  -7.133 1.10e-11 ***
#Ankle:Density   -18.2834     1.4088 -12.978  < 2e-16 ***

#Residual standard error: 1.177 on 245 degrees of freedom
#Multiple R-squared:  0.9807,	Adjusted R-squared:  0.9802 
#F-statistic:  2075 on 6 and 245 DF,  p-value: < 2.2e-16


AIC(lm(BodyFat~Weight+Abdomen+Ankle+Density:Weight+
         +Density:Abdomen+Density:Ankle,data=bodyfat_data))
#[1] 806.0512
BIC(lm(BodyFat~Weight+Abdomen+Ankle+Density:Weight+
           +Density:Abdomen+Density:Ankle,data=bodyfat_data))
#[1] 834.2866

#For Two-Way Interactions, Final Model is 
#y=15.8983-2.2851(Weight)+4.3069(Abdomen)+19.1773(Ankle)
#+2.1706(Weight*Density)-4.0301(Abdomen*Density)-18.2834(Ankle*Density)




cor.test(bodyfat_data$Density,bodyfat_data$Ankle)
#t = -4.3434, df = 250, p-value = 2.04e-05
#-0.26489

cor.test(bodyfat_data$Weight,bodyfat_data$Density)
#t = -11.677, df = 250, p-value < 2.2e-16
#-0.5940619

cor.test(bodyfat_data$Abdomen,bodyfat_data$Density)
#t = -21.006, df = 250, p-value < 2.2e-16
#-0.7989546

#Density has negative correlation with various factors. This can partially be a result of
#Body Fat having lower density than muscle.

plot(lm(BodyFat~Weight+Abdomen+Ankle+Density:Weight+
          Density:Abdomen+Density:Ankle,data=bodyfat_data))
#Based on Residuals Plot, we can see that the points are scattered randomly around 
#a zero line, meaning we can infer the residuals have constant variance

#QQ Plot gives most points on the line so we can infer normal distribution

#Scale-Location plot contains only slight curvature and points are scattered
#randomly across the line, but let's try a statistical test

library(lmtest)

bptest(lm(BodyFat~Weight+Abdomen+Ankle+Density:Weight+
            Density:Abdomen+Density:Ankle,data=bodyfat_data))
#BP = 40.51, df = 6, p-value = 3.616e-07
#BP Test indicated heteroscedasticity, and points are not evenly spread


#Let's try a stepwise model
step(lm(BodyFat~.^2,data=bodyfat_data),direction = 'backward')

step_func<-lm(formula = BodyFat ~ Density + Age + Weight + Height + Neck + 
                Chest + Abdomen + Hip + Thigh + Knee + Ankle + Biceps + Forearm + 
                Wrist + Density:Age + Density:Weight + Density:Neck + Density:Abdomen + 
                Density:Thigh + Density:Knee + Density:Ankle + Density:Biceps + 
                Density:Wrist + Age:Weight + Age:Height + Age:Abdomen + Age:Knee + 
                Age:Ankle + Age:Biceps + Age:Wrist + Weight:Hip + Weight:Thigh + 
                Weight:Knee + Weight:Ankle + Height:Chest + Height:Hip + 
                Height:Thigh + Height:Biceps + Neck:Biceps + Chest:Hip + 
                Chest:Thigh + Chest:Knee + Chest:Ankle + Chest:Biceps + Abdomen:Hip + 
                Abdomen:Thigh + Abdomen:Knee + Abdomen:Forearm + Abdomen:Wrist + 
                Hip:Knee + Hip:Ankle + Hip:Forearm + Hip:Wrist + Thigh:Knee + 
                Knee:Wrist + Ankle:Wrist + Biceps:Forearm + Biceps:Wrist, 
              data = bodyfat_data)

plot(step_func)

#Residuals and QQ Plots indicate equal variance and normality

bptest(step_func)
#BP = 37.502, df = 58, p-value = 0.9832
#BP indicates homoscedasicity 

AIC(step_func)
#634.9274


BIC(step_func)
#846.6931

#BIC is higher than manual model, but there are no issues of homoscedasticity here

summary(step_func)
#Coefficients:
#                  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)     -2.319e+02  2.353e+02  -0.985 0.325620    
#Density          1.863e+02  1.861e+02   1.001 0.318098    
#Age              1.662e+00  7.784e-01   2.134 0.034066 *  
#Weight          -4.951e+00  6.491e-01  -7.626 1.07e-12 ***
#Height          -5.485e-01  4.335e-01  -1.265 0.207272    
#Neck             7.394e+00  3.342e+00   2.213 0.028092 *  
#Chest           -1.310e+00  4.997e-01  -2.621 0.009456 ** 
#Abdomen          6.419e+00  1.203e+00   5.338 2.63e-07 ***
#Hip              3.389e+00  1.278e+00   2.652 0.008667 ** 
#Thigh            1.380e+01  3.433e+00   4.020 8.33e-05 ***
#Knee            -2.080e+01  6.023e+00  -3.453 0.000681 ***
#Ankle            3.432e+01  6.090e+00   5.635 6.12e-08 ***
#Biceps           1.487e+01  2.928e+00   5.076 9.02e-07 ***
#Forearm          1.420e+00  6.059e-01   2.344 0.020105 *  
#Wrist           -4.435e+01  1.202e+01  -3.690 0.000291 ***
#Density:Age     -9.522e-01  6.064e-01  -1.570 0.117968    
#Density:Weight   3.860e+00  5.275e-01   7.317 6.64e-12 ***
#Density:Neck    -5.487e+00  2.916e+00  -1.881 0.061442 .  
#Density:Abdomen -5.005e+00  9.350e-01  -5.353 2.44e-07 ***
#Density:Thigh   -1.468e+01  2.728e+00  -5.381 2.14e-07 ***
#Density:Knee     1.980e+01  5.219e+00   3.794 0.000198 ***
#Density:Ankle   -2.967e+01  4.631e+00  -6.408 1.10e-09 ***
#Density:Biceps  -1.003e+01  2.460e+00  -4.077 6.66e-05 ***
#Density:Wrist    2.905e+01  1.007e+01   2.885 0.004357 ** 
#Age:Weight       2.375e-03  8.150e-04   2.914 0.003991 ** 
#Age:Height      -4.545e-03  2.934e-03  -1.549 0.122965    
#Age:Abdomen     -4.220e-03  1.715e-03  -2.461 0.014746 *  
#Age:Knee         7.710e-03  4.910e-03   1.570 0.117964    
#Age:Ankle       -3.403e-02  5.590e-03  -6.087 6.08e-09 ***
#Age:Biceps      -1.649e-02  3.556e-03  -4.637 6.51e-06 ***
#Age:Wrist        3.647e-02  8.967e-03   4.067 6.94e-05 ***
#Weight:Hip       1.162e-02  2.918e-03   3.982 9.67e-05 ***
#Weight:Thigh    -8.556e-03  3.989e-03  -2.145 0.033220 *  
#Weight:Knee      1.394e-02  7.160e-03   1.947 0.052947 .  
#Weight:Ankle    -1.748e-02  9.703e-03  -1.802 0.073174 .  
#Height:Chest     2.326e-02  5.929e-03   3.924 0.000121 ***
#Height:Hip      -2.495e-02  1.161e-02  -2.149 0.032843 *  
#Height:Thigh     2.763e-02  1.566e-02   1.764 0.079255 .  
#Height:Biceps   -2.331e-02  1.313e-02  -1.776 0.077379 .  
#Neck:Biceps     -5.104e-02  1.843e-02  -2.770 0.006159 ** 
#Chest:Hip       -9.377e-03  6.722e-03  -1.395 0.164621    
#Chest:Thigh      2.307e-02  8.977e-03   2.570 0.010935 *  
#Chest:Knee      -2.692e-02  1.962e-02  -1.372 0.171652    
#Chest:Ankle      3.588e-02  2.110e-02   1.701 0.090615 .  
#Chest:Biceps    -1.719e-02  7.565e-03  -2.273 0.024159 *  
#Abdomen:Hip     -9.139e-03  6.713e-03  -1.361 0.174973    
#Abdomen:Thigh   -2.723e-02  8.699e-03  -3.130 0.002018 ** 
#Abdomen:Knee     3.946e-02  1.710e-02   2.308 0.022064 *  
#Abdomen:Forearm  3.545e-02  1.174e-02   3.019 0.002877 ** 
#Abdomen:Wrist   -5.211e-02  3.058e-02  -1.704 0.089960 .  
#Hip:Knee        -3.869e-02  2.144e-02  -1.805 0.072691 .  
#Hip:Ankle       -6.442e-02  2.753e-02  -2.340 0.020320 *  
#Hip:Forearm     -3.272e-02  1.459e-02  -2.243 0.026012 *  
#Hip:Wrist        1.105e-01  3.834e-02   2.882 0.004404 ** 
#Thigh:Knee       3.834e-02  2.085e-02   1.839 0.067451 .  
#Knee:Wrist      -1.324e-01  8.211e-02  -1.613 0.108479    
#Ankle:Wrist      2.436e-01  1.092e-01   2.231 0.026862 *  
#Biceps:Forearm  -4.286e-02  1.722e-02  -2.488 0.013676 *  
#Biceps:Wrist     1.648e-01  5.466e-02   3.015 0.002914 **

#Residual standard error: 0.7681 on 193 degrees of freedom
#Multiple R-squared:  0.9935,	Adjusted R-squared:  0.9916 
#F-statistic: 510.5 on 58 and 193 DF,  p-value: < 2.2e-16