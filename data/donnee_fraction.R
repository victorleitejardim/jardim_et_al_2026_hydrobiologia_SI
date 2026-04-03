library(dplyr)
library(ggplot2)
library(tidyverse)

#---- 2023----
full<- list(
  #----MRZ----
  mrz_1_1_1 = data.frame(site = "Rozegat", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.69,23.01,13.70,11.41,7.37)),
  mrz_1_1_2 = data.frame(site = "Rozegat", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,21.36,16.44,12.35,7.33)),
  mrz_1_1_3 = data.frame(site = "Rozegat", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.86,20.25,15.84,13.57,6.56)),
  
  mrz_1_2_1 = data.frame(site = "Rozegat", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,10.32,8.55,7.15,3.60)),
  mrz_1_2_2 = data.frame(site = "Rozegat", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.31,14.31,8.21,5.3,1.49)),
  mrz_1_2_3 = data.frame(site = "Rozegat", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.63,14.08,8.14,4.83,1.84)),
  
  mrz_1_3_1 = data.frame(site = "Rozegat", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,6.41,8.82,7.65,4.90)),
  mrz_1_3_2 = data.frame(site = "Rozegat", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,9.75,7.88,6.86,3.15)),
  mrz_1_3_3 = data.frame(site = "Rozegat", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,7.37,9.29,6.38,NA)),
  
  mrz_1_4_1 = data.frame(site = "Rozegat", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.23,28.75,22.95,14.64,7.22)),
  mrz_1_4_2 = data.frame(site = "Rozegat", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.19,8.56,38.62,21.85,7.46,2.89)),
  mrz_1_4_3 = data.frame(site = "Rozegat", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.2,7.41,44.55,14.86,9.37,3.16)),
  
  mrz_2_1_1 = data.frame(site = "Rozegat", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.37, 11.1,11.45,4.44,2.17)),
  mrz_2_1_2 = data.frame(site = "Rozegat", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,12.66,11.1,4.25,1.42)),
  mrz_2_1_3 = data.frame(site = "Rozegat", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,11.91,11.02,4.54,1.88)),
  
  mrz_2_2_1 = data.frame(site = "Rozegat", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,13.27,9.77,5.62,3.01)),
  mrz_2_2_2 = data.frame(site = "Rozegat", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.23,18.64,8.99,2.82,0.87)),
  mrz_2_2_3 = data.frame(site = "Rozegat", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.22,19.14,7.25,2.92,1.06)),
  
  mrz_2_3_1 = data.frame(site = "Rozegat", point = 2, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,10.22,10.68,10.06,6.32)),
  mrz_2_3_2 = data.frame(site = "Rozegat", point = 2, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.18,14.13,10.32,8.52,3.14)),
  mrz_2_3_3 = data.frame(site = "Rozegat", point = 2, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.27,16.51,8.31,9.37,2.77)),
  
  mrz_2_4_1 = data.frame(site = "Rozegat", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,40.55,138.69,22.19,24.53,0)),
  mrz_2_4_2 = data.frame(site = "Rozegat", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(3.87, 34.27, 107.32, 33.41,28.78,0)),
  mrz_2_4_3 = data.frame(site = "Rozegat", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(2.5,24.78,118.43,36.57,21.3,0)),
  
  mrz_3_1_1 = data.frame(site = "Rozegat", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.48,15.74,13.16,5.97,3.32)),
  mrz_3_1_2 = data.frame(site = "Rozegat", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.61,23.78,8.91,3.05,1.28)),
  mrz_3_1_3 = data.frame(site = "Rozegat", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.32,24.19,8.55,3.06,1.1)),
  
  mrz_3_2_1 = data.frame(site = "Rozegat", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.41,26.48,10.52,5.46,2.12)),
  mrz_3_2_2 = data.frame(site = "Rozegat", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.55,5.07,31.04,6.92,3.23,1.07)),
  mrz_3_2_3 = data.frame(site = "Rozegat", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.53,5.55,31.37,6.8,2.49,1.05)),
  
  mrz_3_3_1 = data.frame(site = "Rozegat", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.95,25.05,6.56,3.1,1.76)),
  mrz_3_3_2 = data.frame(site = "Rozegat", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.04,4.44,25.25,5.45,2.44,0.76)),
  mrz_3_3_3 = data.frame(site = "Rozegat", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0.97,4.07,28.82,3.56,1.4,0.58)),

  mrz_3_4_1 = data.frame(site = "Rozegat", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(17.43, 47.01,137.78,23.62,16.67,0)),
  mrz_3_4_2 = data.frame(site = "Rozegat", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(12.8,39.2,145.7,23.25,13.89,0)),
  mrz_3_4_3 = data.frame(site = "Rozegat", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(9.5,47.03,133.25,21.55,14.04,0)),
  
  
  #-----Keraliou----           
  
  mbk_1_1_1 = data.frame(site = "Keraliou", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.91,22.66,8.86,4.21,1.75)),
  mbk_1_1_2 = data.frame(site = "Keraliou", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.98,24.93,6.81,4.17,2.24)),
  mbk_1_1_3 = data.frame(site = "Keraliou", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.78,24.83,5.64,5.45,2.18)),
  
  mbk_1_2_1 = data.frame(site = "Keraliou", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.11,10.15,4.77,3.74,1.98)),
  mbk_1_2_2 = data.frame(site = "Keraliou", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.15,9.61,6.37,2.73,1.74)),
  mbk_1_2_3 = data.frame(site = "Keraliou", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.22,10.44,5.31,4.53,1.14)),
  
  mbk_1_3_1 = data.frame(site = "Keraliou", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.39,17.73,6.99,3.56,0.8)),
  mbk_1_3_2 = data.frame(site = "Keraliou", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.48,19.58,5.41,2.81,1.1)),
  mbk_1_3_3 = data.frame(site = "Keraliou", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.46,19.09,6.41,3.51,0.9)),
  
  mbk_1_4_1 = data.frame(site = "Keraliou", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(4.18, 28.69, 109.04, 17.62, 22.47, 0)),
  mbk_1_4_2 = data.frame(site = "Keraliou", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(4.14, 22.01, 106.87, 21.39, 22.9,0)),
  mbk_1_4_3 = data.frame(site = "Keraliou", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(4.19, 24.3, 100.07, 22.14, 22.42, 0)),
  
  mbk_2_1_1 = data.frame(site = "Keraliou", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.22,25.05,8.69,6.12,3.05)),
  mbk_2_1_2 = data.frame(site = "Keraliou", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.24,24.78,8.87,7.26,3.82)),
  mbk_2_1_3 = data.frame(site = "Keraliou", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.77,22.67,12.21,5.06,3.23)),
  
  mbk_2_2_1 = data.frame(site = "Keraliou", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.12,29.78,10.72,1.25,2.18)),
  mbk_2_2_2 = data.frame(site = "Keraliou", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.3,30.04,9.16,5.25,2.27)),
  mbk_2_2_3 = data.frame(site = "Keraliou", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.54,30.38,8.19,6.62,2.31)),
  
  mbk_2_3_1 = data.frame(site = "Keraliou", point = 2, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.34,15.66,5.08,2.12,1.01)),
  mbk_2_3_2 = data.frame(site = "Keraliou", point = 2, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.85,16.74,5.29,2.31,0.98)),
  mbk_2_3_3 = data.frame(site = "Keraliou", point = 2, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,17.82,5.33,2.06,0.9)),
  
  mbk_2_4_1 = data.frame(site = "Keraliou", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(3.34,30.66,119.13,43.99,40.24,0)),
  mbk_2_4_2 = data.frame(site = "Keraliou", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0.27,32.86,112.09,37.42,38.42,0)),
  mbk_2_4_3 = data.frame(site = "Keraliou", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.26,30.47,114.53,34.86,32.45,0)),
  
  mbk_3_1_1 = data.frame(site = "Keraliou", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.56,21.14,7.11,5.23,4.32)),
  mbk_3_1_2 = data.frame(site = "Keraliou", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.09,18.03,8.26,7.19,3.91)),
  mbk_3_1_3 = data.frame(site = "Keraliou", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,16.22,8.82,8.34,4.25)),
  
  mbk_3_2_1 = data.frame(site = "Keraliou", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.22,44.77,8.34,3.51,1.25)),
  mbk_3_2_2 = data.frame(site = "Keraliou", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.54,42.92,9.36,2.83,2.21)),
  mbk_3_2_3 = data.frame(site = "Keraliou", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.73,39.80,10.93,6.90,2.41)),
  
  mbk_3_3_1 = data.frame(site = "Keraliou", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.55,12.1,6.96,3.72,3.12)),
  mbk_3_3_2 = data.frame(site = "Keraliou", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1,11.75,6.5,4.9,3.43)),
  mbk_3_3_3 = data.frame(site = "Keraliou", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.2,10.6,6.11,5.88,3.59)),
  
  mbk_3_4_1 = data.frame(site = "Keraliou", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,12.51,120.92,38.73,21.4,19.58)),
  mbk_3_4_2 = data.frame(site = "Keraliou", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,10.92,157.55,9.12,14.8,19.09)),
  mbk_3_4_3 = data.frame(site = "Keraliou", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,14.69,131.76,44.68,NA,19.8)),
  
  #----Saint-Brieuc----           
  
  mpp_1_1_1 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(7.66,6.30,23.99,5.5,2.93,1.02)),
  mpp_1_1_2 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(7.66,12.39,19.1,6.09,1.58,0.51)),
  mpp_1_1_3 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(7.65,9.7,22.04,4.28,2.46,1.25)),
  
  mpp_1_2_1 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,10.13,17.71,5.46,3.98,1.25)),
  mpp_1_2_2 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0.93,12.6,16.68,4.94,2.66,0.8)),
  mpp_1_2_3 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(6.54,6.19,16.66,6.03,2.19,0.95)),
  
  mpp_1_3_1 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(16.05,19.4,25.64,6.61,4.04,2.17)),
  mpp_1_3_2 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(10.1,27,25.88,6,2.7,2.58)),
  mpp_1_3_3 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(15.95,24.2,22.4,7.47,2.05,1.84)),
  
  mpp_1_4_1 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(55.6,38.76,47.50,11.56,7.74,0)),
  mpp_1_4_2 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(65.25,25.27,49.05,11.50,7.60,0)),
  mpp_1_4_3 = data.frame(site = "Saint-Brieuc", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(64.89,30.12,44.19,11.68,5.42,0)),
  
  mpp_2_1_1 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(7.42,13.04,13.52,4.85,3.63,1.45)),
  mpp_2_1_2 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(8.88,9.69,15.35,3.99,3.7,1.83)),
  mpp_2_1_3 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(7.86,10.66,15.92,4.36,3.05,1.62)),
  
  mpp_2_2_1 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(8.22,7,16.69,6.84,3.11,2.28)),
  mpp_2_2_2 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(9.73,6.38,20.59,5.86,1.31,0.25)),
  mpp_2_2_3 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(5.88,8.7,21.23,5.71,1.86,0.65)),
  
  mpp_2_3_1 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.34,15.66,5.08,2.12,1.01)),
  mpp_2_3_2 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(19.09,7.35,15.79,5.45,2.03,0.61)),
  mpp_2_3_3 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(19.51,5.55,18.13,4.72,NA,0.68)),
  
  mpp_2_4_1 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(50.92,35.12,91.81,20.55,9.48,5.06)),
  mpp_2_4_2 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(48.35,37.75,94.4,20.14,7.72,4)),
  mpp_2_4_3 = data.frame(site = "Saint-Brieuc", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(46.15,42.76,93.29,17.97,8.57,4)),
  
  mpp_3_1_1 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.56,21.14,7.11,5.23,4.32)),
  mpp_3_1_2 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(16.82,4.35,15,2.8,1.65,0.49)),
  mpp_3_1_3 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(11.52,9.28,16.2,2.8,0.99,0.3)),
  
  mpp_3_2_1 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.22,44.77,8.34,3.51,1.25)),
  mpp_3_2_2 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.15,11.1,16.12,4.55,0.59,0.29)),
  mpp_3_2_3 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(5.83,4.84,19.35,3.61,0.84,0.29)),
  
  mpp_3_3_1 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.55,12.1,6.96,3.72,3.12)),
  mpp_3_3_2 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(14.88,13.21,14.61,2.76,1.7,0.27)),
  mpp_3_3_3 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(20.87,9.94,12.39,2.97,0.97,0.11)),
  
  mpp_3_4_1 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(24.21,24.73,65.59,15.42,13.53,0)),
  mpp_3_4_2 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(24.03,26.22,60.63,15.98,10.94,0)),
  mpp_3_4_3 = data.frame(site = "Saint-Brieuc", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(19.77,21.18,67.28,19.22,9.05,0)),
  
  #-----Morlaix-----            
  
  mmx_1_1_1 = data.frame(site = "Morlaix", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_1_1_2 = data.frame(site = "Morlaix", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_1_1_3 = data.frame(site = "Morlaix", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmx_1_2_1 = data.frame(site = "Morlaix", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1,8.37,6.6,5.11,0.65)),
  mmx_1_2_2 = data.frame(site = "Morlaix", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1,1,6.05,8.06,4.33,NA)),
  mmx_1_2_3 = data.frame(site = "Morlaix", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.86,7.41,7.31,3.14,NA)),
  
  mmx_1_3_1 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.92,6.94,1.17,0.16,0)),
  mmx_1_3_2 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.92,6.96,1.06,0.15,0)),
  mmx_1_3_3 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.92,7.21,0.84,0.21,0)),
  
  mmx_1_4_1 = data.frame(site = "Morlaix", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_1_4_2 = data.frame(site = "Morlaix", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_1_4_3 = data.frame(site = "Morlaix", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmx_2_1_1 = data.frame(site = "Morlaix", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.11,13.24,7.65,2.31,2.16)),
  mmx_2_1_2 = data.frame(site = "Morlaix", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.56,15.42,4.83,2.5,1.88)),
  mmx_2_1_3 = data.frame(site = "Morlaix", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.05,14.95,5.04,2.7,1.57)),
  
  mmx_2_2_1 = data.frame(site = "Morlaix", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.98,12.10,7.27,5.55,3.12)),
  mmx_2_2_2 = data.frame(site = "Morlaix", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.87,15.79,5.26,2.98,1.32)),
  mmx_2_2_3 = data.frame(site = "Morlaix", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.08,14.94,7.04,2.1,0.98)),
  
  mmx_2_3_1 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_2_3_2 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_2_3_3 = data.frame(site = "Morlaix", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmx_2_4_1 = data.frame(site = "Morlaix", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_2_4_2 = data.frame(site = "Morlaix", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmx_2_4_3 = data.frame(site = "Morlaix", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmx_3_1_1 = data.frame(site = "Morlaix", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.95,8.57,4.14,1.98,1.11)),
  mmx_3_1_2 = data.frame(site = "Morlaix", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.29,5.12,4.91,2.72,2.42)),
  mmx_3_1_3 = data.frame(site = "Morlaix", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.74,7.93,4.88,1.94,0.97)),
  
  mmx_3_2_1 = data.frame(site = "Morlaix", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.75,5.79,4.35,2.70,2.14)),
  mmx_3_2_2 = data.frame(site = "Morlaix", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.68,6.67,4.71,1.59,1.1)),
  mmx_3_2_3 = data.frame(site = "Morlaix", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.58,8.04,4.84,1.43,0.82)),
  
  mmx_3_3_1 = data.frame(site = "Morlaix", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.31,4.56,5.3,3.08,2.8)),
  mmx_3_3_2 = data.frame(site = "Morlaix", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.73,5.42,3.75,3.74,2.46)),
  mmx_3_3_3 = data.frame(site = "Morlaix", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.99,4.6,3.57,2.7,2.57)),
  
  mmx_3_4_1 = data.frame(site = "Morlaix", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.31,4.56,5.3,3.08,2.8)),
  mmx_3_4_2 = data.frame(site = "Morlaix", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.73,5.42,3.75,3.74,2.46)),
  mmx_3_4_3 = data.frame(site = "Morlaix", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.99,4.6,3.57,2.7,2.57)),
  
  #----Trevignon-----            
  
  mtr_1_1_1 = data.frame(site = "Trevignon", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.66,6.81,21.01,9.5,2.39,0.62)),
  mtr_1_1_2 = data.frame(site = "Trevignon", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.67,6.27,21.8,8.73,3.04,0.51)),
  mtr_1_1_3 = data.frame(site = "Trevignon", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(3.42,8.87,18.88,8.91,3.59,0.96)),
  
  mtr_1_2_1 = data.frame(site = "Trevignon", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(8.4,10.82,29.09,11.4,6.68,4.15)),
  mtr_1_2_2 = data.frame(site = "Trevignon", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(7.9,9.65,32.01,9.57,6.82,4.34)),
  mtr_1_2_3 = data.frame(site = "Trevignon", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(7,10.06,29.06,12.07,7.88,4.26)),
  
  mtr_1_3_1 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(3.45,13.04,33.83,8.12,6.25,2.29)),
  mtr_1_3_2 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(4.7,12.04,33.51,8.53,2.73,2.65)),
  mtr_1_3_3 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,19.32,29.46,9.04,7.13,2.13)),
  
  mtr_1_4_1 = data.frame(site = "Trevignon", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(46.25,51.34,54.38,10.13,3.95,2.59)),
  mtr_1_4_2 = data.frame(site = "Trevignon", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(49.19,49.33,51.91,12.82,3.02,2.18)),
  mtr_1_4_3 = data.frame(site = "Trevignon", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(50.20,20.14,47.71,11.68,5.03,3.18)),
  
  mtr_2_1_1 = data.frame(site = "Trevignon", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(3.95,13.27,45.64,8.03,3.4,0.54)),
  mtr_2_1_2 = data.frame(site = "Trevignon", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(3.78,14.15,43,10.33,3.03,0.73)),
  mtr_2_1_3 = data.frame(site = "Trevignon", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(3.67,10.73,40.08,10.23,3.22,0.85)),
  
  mtr_2_2_1 = data.frame(site = "Trevignon", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(5.7,24.57,50.93,14.17,9.9,6.22)),
  mtr_2_2_2 = data.frame(site = "Trevignon", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(7.1,19.57,53.73,14.66,9.73,6.21)),
  mtr_2_2_3 = data.frame(site = "Trevignon", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(14.73,17.82,48.55,14.29,8.66,6.97)),
  
  mtr_2_3_1 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(6.93,15.22,33.5,4.83,1.06,0.52)),
  mtr_2_3_2 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(4.05,18.5,32.29,5.7,1.04,0.48)),
  mtr_2_3_3 = data.frame(site = "Trevignon", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(5.58,14.18,35.04,5.29,1.26,0.52)),
  
  
  mtr_2_4_1 = data.frame(site = "Trevignon", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(56.96, 77.62, 110.16, 25.04, 20.36, 12.17)),
  mtr_2_4_2 = data.frame(site = "Trevignon", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(59.36, 67.50, 109.1, 35.36, 19.65, 12.26)),
  mtr_2_4_3 = data.frame(site = "Trevignon", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(65.79, 60.04, 117.21, 28.41, 19.13, 12.42)),
  
  mtr_3_1_1 = data.frame(site = "Trevignon", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mtr_3_1_2 = data.frame(site = "Trevignon", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mtr_3_1_3 = data.frame(site = "Trevignon", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mtr_3_2_1 = data.frame(site = "Trevignon", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(22.07,9.13,35.33,7.69,3.32,2.53)),
  mtr_3_2_2 = data.frame(site = "Trevignon", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(15.80,12.92,37.42,7.68,3.78,2.57)),
  mtr_3_2_3 = data.frame(site = "Trevignon", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(18.99,6.17,39.78,7.47,4.42,3.17)),
  
  mtr_3_3_1 = data.frame(site = "Trevignon", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(10.6,10.28,17.29,7.92,7.54,2.93)),
  mtr_3_3_2 = data.frame(site = "Trevignon", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(6.35,11.04,20.6,10.13,5.7,2.77)),
  mtr_3_3_3 = data.frame(site = "Trevignon", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(8.65,6.03,23,8.1,8.05,2.93)),
  
  mtr_3_4_1 = data.frame(site = "Trevignon", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(10.6,10.28,17.29,7.92,7.54,2.93)),
  mtr_3_4_2 = data.frame(site = "Trevignon", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(6.35,11.04,20.6,10.13,5.7,2.77)),
  mtr_3_4_3 = data.frame(site = "Trevignon", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(8.65,6.03,23,8.1,8.05,2.93)),
  
  #----Meaban----            
  
  mme_1_1_1 = data.frame(site = "Meaban", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_1_1_2 = data.frame(site = "Meaban", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_1_1_3 = data.frame(site = "Meaban", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mme_1_2_1 = data.frame(site = "Meaban", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_1_2_2 = data.frame(site = "Meaban", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_1_2_3 = data.frame(site = "Meaban", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mme_1_3_1 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.8,40.62,2.86,0.36,0.25)),
  mme_1_3_2 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.28,38.25,2.64,0.38,0.31)),
  mme_1_3_3 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.04,40.85,2.69,0.67,0.47)),
  
  mme_1_4_1 = data.frame(site = "Meaban", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.17,2.61,31.84,11.47,3.18,0.22)),
  mme_1_4_2 = data.frame(site = "Meaban", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.59,2.95,31.32,12.53,4.21,0.52)),
  mme_1_4_3 = data.frame(site = "Meaban", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(2.56,3,29.36,15.55,3.19,0.38)),
  
  mme_2_1_1 = data.frame(site = "Meaban", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.64,38.16,11.18,4.75,2.21)),
  mme_2_1_2 = data.frame(site = "Meaban", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.6,33.13,14.79,5.52,2.68)),
  mme_2_1_3 = data.frame(site = "Meaban", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.06,33.87,14.96,4.53,3.17)),
  
  mme_2_2_1 = data.frame(site = "Meaban", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(1.18, 3.6, 26.91,1.68,0.15,0)),
  mme_2_2_2 = data.frame(site = "Meaban", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.02,2.23,26.83,1.92,0.38,0.12)),
  mme_2_2_3 = data.frame(site = "Meaban", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 3.13,28.21,1.42,0.45,0.30)),
  
  mme_2_3_1 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_2_3_2 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_2_3_3 = data.frame(site = "Meaban", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mme_2_4_1 = data.frame(site = "Meaban", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,15.9,62.44,13.9,4.54,1.15)),
  mme_2_4_2 = data.frame(site = "Meaban", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.11,12.25,61.52,16.16,5.33,1.21)),
  mme_2_4_3 = data.frame(site = "Meaban", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,13.18,64.83,12.95,5.47,1.35)),
  
  mme_3_1_1 = data.frame(site = "Meaban", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 0.76,23.24,13.5,6.12,2.78)),
  mme_3_1_2 = data.frame(site = "Meaban", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, .64,22.01,12.79,7.45,3.18)),
  mme_3_1_3 = data.frame(site = "Meaban", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,21.9,14.55,7.37,3.48)),
  
  mme_3_2_1 = data.frame(site = "Meaban", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_3_2_2 = data.frame(site = "Meaban", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mme_3_2_3 = data.frame(site = "Meaban", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mme_3_3_1 = data.frame(site = "Meaban", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.2,20.87,11.73,2.43,0.40)),
  mme_3_3_2 = data.frame(site = "Meaban", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.57,22.97,10.34,2.15,0.58)),
  mme_3_3_3 = data.frame(site = "Meaban", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.21,20,10.72,3.08,0.49)),
  
  mme_3_4_1 = data.frame(site = "Meaban", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.76,42.54,3.43,0,0.23)),
  mme_3_4_2 = data.frame(site = "Meaban", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,8.01,39.75,5.71,0.12,0.33)),
  mme_3_4_3 = data.frame(site = "Meaban", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,8.68,38.82,5.9,0.16,0.31)),
  
  #----Camaret-----           
  
  mcm_1_1_1 = data.frame(site = "Camaret", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.81,9.11,17.34,6.21,1.83,1.27)),
  mcm_1_1_2 = data.frame(site = "Camaret", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.77,6.7,20.55,5.34,1.82,0.98)),
  mcm_1_1_3 = data.frame(site = "Camaret", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(2.74,14.84,12.69,5.22,1.67,1.06)),
  
  mcm_1_2_1 = data.frame(site = "Camaret", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.55,10.91,20,5.88,2.6,0.85)),
  mcm_1_2_2 = data.frame(site = "Camaret", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,12.64,21.04,4.44,3.86,1.02)),
  mcm_1_2_3 = data.frame(site = "Camaret", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0.74,12.53,19.09,6.9,2.73,1)),
  
  mcm_1_3_1 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.71,9.7,24.08,6.86,2.97,0.72)),
  mcm_1_3_2 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.72,8.99,26.18,5.81,2.89,0.27)),
  mcm_1_3_3 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(3.35,6.82,24.88,7.55,2.95,0.2)),
  
  mcm_1_4_1 = data.frame(site = "Camaret", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,26.58,46.7,3.96,0.22,0.08)),
  mcm_1_4_2 = data.frame(site = "Camaret", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 25.41, 48.21, 3.2, 0.45, 0.18)),
  mcm_1_4_3 = data.frame(site = "Camaret", point = 1, echantillon = 4, replicat = 3, fraction = c(16, 10, 5, 4, 3.15, 2), poids = c(0, 30.18, 43.6, 2.88, 0.4, 0.28)),
  
  mcm_2_1_1 = data.frame(site = "Camaret", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,12,34.40,2.31, 0.15, 0.12)),
  mcm_2_1_2 = data.frame(site = "Camaret", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,8.4,37.83,2.11,0.18,0.16)),
  mcm_2_1_3 = data.frame(site = "Camaret", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.20,41.65,2.05,0.57,0.14)),
  
  mcm_2_2_1 = data.frame(site = "Camaret", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_2_2_2 = data.frame(site = "Camaret", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_2_2_3 = data.frame(site = "Camaret", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mcm_2_3_1 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_2_3_2 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_2_3_3 = data.frame(site = "Camaret", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mcm_2_4_1 = data.frame(site = "Camaret", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 13.76, 70.23, 22.5, 22.45,0)),
  mcm_2_4_2 = data.frame(site = "Camaret", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 10.18, 69.54, 23.29, 22.8, 0)),
  mcm_2_4_3 = data.frame(site = "Camaret", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 7.59, 71.72, 23.3, 23.16, 0)),
  
  mcm_3_1_1 = data.frame(site = "Camaret", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,5.84,23.12,4.2,0.62,0.25)),
  mcm_3_1_2 = data.frame(site = "Camaret", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,6.42,22.6,4.11,0.68,0.19)),
  mcm_3_1_3 = data.frame(site = "Camaret", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,6.08,23.64,3.22,0.87,0.17)),
  
  mcm_3_2_1 = data.frame(site = "Camaret", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_3_2_2 = data.frame(site = "Camaret", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_3_2_3 = data.frame(site = "Camaret", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mcm_3_3_1 = data.frame(site = "Camaret", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_3_3_2 = data.frame(site = "Camaret", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mcm_3_3_3 = data.frame(site = "Camaret", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mcm_3_4_1 = data.frame(site = "Camaret", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 5.2, 36.31, 14.64, 10.94, 0)),
  mcm_3_4_2 = data.frame(site = "Camaret", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 6.13, 35.63, 13.04, 12.35, 0)),
  mcm_3_4_3 = data.frame(site = "Camaret", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 3.43, 38.89, 12.08, 12.37, 0)),
  #-----Molene-----           
  mmo_1_1_1 = data.frame(site = "Molene", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(8.16,4.59,17.87,1.54,0.19,0.1)),
  mmo_1_1_2 = data.frame(site = "Molene", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(5.54,8.88,15.07,2.55,0.24,0.17)),
  mmo_1_1_3 = data.frame(site = "Molene", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(4.77,7.94,15.52,3.49,0.47,0.17)),
  
  mmo_1_2_1 = data.frame(site = "Molene", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_1_2_2 = data.frame(site = "Molene", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_1_2_3 = data.frame(site = "Molene", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmo_1_3_1 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.51,12.71,5.40,2.62,1.32)),
  mmo_1_3_2 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.02,2.37,13.57,5.92,2.15,1.6)),
  mmo_1_3_3 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0.57,2.48,13.52,5.19,2.99,1.40)),
  
  mmo_1_4_1 = data.frame(site = "Molene", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(23.1, 39.67, 57.03, 11.95, 7.52, 0)),
  mmo_1_4_2 = data.frame(site = "Molene", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(24.59, 34.24, 58.17, 11.9, 10.21, 0)),
  mmo_1_4_3 = data.frame(site = "Molene", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(20.65, 39.55, 54.71, 10.86, 12.43, 0)),
  
  mmo_2_1_1 = data.frame(site = "Molene", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(2.18,8.13,29.82,10.05,4.79,2.12)),
  mmo_2_1_2 = data.frame(site = "Molene", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.9,6.77,28.44,10.47,6.22,1.97)),
  mmo_2_1_3 = data.frame(site = "Molene", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.9,3.82,29.4,10.01,6.27,2.91)),
  
  mmo_2_2_1 = data.frame(site = "Molene", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_2_2_2 = data.frame(site = "Molene", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_2_2_3 = data.frame(site = "Molene", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmo_2_3_1 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,6.28,31.26,7.79,8.7,8.54)),
  mmo_2_3_2 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.18,30.61,12.21,10.09,5.11)),
  mmo_2_3_3 = data.frame(site = "Molene", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0.49,4.88,29.34,12.99,8.06,6.24)),
  
  mmo_2_4_1 = data.frame(site = "Molene", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.8,62.38,12.60,6.58,0.45 )),
  mmo_2_4_2 = data.frame(site = "Molene", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,8.19,62.03,13.63,4.6,1.11)),
  mmo_2_4_3 = data.frame(site = "Molene", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,8.98,61,13.54,4.07,0.81)),
  
  mmo_3_1_1 = data.frame(site = "Molene", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_3_1_2 = data.frame(site = "Molene", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_3_1_3 = data.frame(site = "Molene", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmo_3_2_1 = data.frame(site = "Molene", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 4.6, 18.46,9.53,4.98,3.89)),
  mmo_3_2_2 = data.frame(site = "Molene", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.97,21.29,7.17,6.05,2.83)),
  mmo_3_2_3 = data.frame(site = "Molene", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.2,3.38,19.86,8.08,5.09,3.55)),
  
  mmo_3_3_1 = data.frame(site = "Molene", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_3_3_2 = data.frame(site = "Molene", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mmo_3_3_3 = data.frame(site = "Molene", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mmo_3_4_1 = data.frame(site = "Molene", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(11.54, 11.52, 55.56, 6.58, 0.5, 0.27)),
  mmo_3_4_2 = data.frame(site = "Molene", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(10.17, 14.23, 53.78, 6.84, 0.7, 0.2)),
  mmo_3_4_3 = data.frame(site = "Molene", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(12.77, 11.87, 51.46, 7.38, 1.6, 0.46)),
  
  
  #----Glenan----
  
  mgl_1_1_1 = data.frame(site = "Glenan", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.31,8.82,8.33,10.47,5.73)),
  mgl_1_1_2 = data.frame(site = "Glenan", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.65,10.57,9.87,5.09, NA)),
  mgl_1_1_3 = data.frame(site = "Glenan", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.32,8.91,9.41,9.55,5.26)),
  
  mgl_1_2_1 = data.frame(site = "Glenan", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(3.28,9.1,18.19,1.81,0.33,0)),
  mgl_1_2_2 = data.frame(site = "Glenan", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.28,9.34,19.03,1.49,0.48,0)),
  mgl_1_2_3 = data.frame(site = "Glenan", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(5.56,7.25,16.92,2.33,0.19,0.26)),
  
  mgl_1_3_1 = data.frame(site = "Glenan", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mgl_1_3_2 = data.frame(site = "Glenan", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mgl_1_3_3 = data.frame(site = "Glenan", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mgl_1_4_1 = data.frame(site = "Glenan", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 12.93, 136.48, 118.29/2, 184.15/2, 0)),
  mgl_1_4_2 = data.frame(site = "Glenan", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 8.26, 134.28, 115.91/2, 140.80/2, 0)),
  mgl_1_4_3 = data.frame(site = "Glenan", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 12.38, 154.30, 100.14/2, 132.87/2, 0)),
  
  mgl_2_1_1 = data.frame(site = "Glenan", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,16.37,8.58,10.31,7.08)),
  mgl_2_1_2 = data.frame(site = "Glenan", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,12.87,10.57,10.89,7.67)),
  mgl_2_1_3 = data.frame(site = "Glenan", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.44,12.86,10.87,9.92,7.95)),
  
  mgl_2_2_1 = data.frame(site = "Glenan", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.62,19.46,12.68,9.26,3.86)),
  mgl_2_2_2 = data.frame(site = "Glenan", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,2.74,19.02,13.99,9.45,3.76)),
  mgl_2_2_3 = data.frame(site = "Glenan", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.76,18,14.09,8.88,4.15)),
  
  mgl_2_3_1 = data.frame(site = "Glenan", point = 2, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.55,18.90,16.57,19.46,13.13)),
  mgl_2_3_2 = data.frame(site = "Glenan", point = 2, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.06,21.91,16.08,15.56,14.54)),
  mgl_2_3_3 = data.frame(site = "Glenan", point = 2, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,6.28,18.49,15.93,18.20,13.47)),
  
  mgl_2_4_1 = data.frame(site = "Glenan", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,23.84,12.24,2.74,0.42)),
  mgl_2_4_2 = data.frame(site = "Glenan", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.09,22.44,11.37,3.65,0.4)),
  mgl_2_4_3 = data.frame(site = "Glenan", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.31,21.96,11.03,4.29,0.42)),
  
  mgl_3_1_1 = data.frame(site = "Glenan", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(4.66,7.67,56.63,24.29,8.95,1.68)),
  mgl_3_1_2 = data.frame(site = "Glenan", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(4.61,12.07,51.17,26.93,7.24,1.67)),
  mgl_3_1_3 = data.frame(site = "Glenan", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(3.72,20.76,48.25,20.92,7.87,1.92)),
  
  mgl_3_2_1 = data.frame(site = "Glenan", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(4.18,8,50.85,13.05,2.49,0)),
  mgl_3_2_2 = data.frame(site = "Glenan", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(2.61,11.94,51.87,11,1.26,0)),
  mgl_3_2_3 = data.frame(site = "Glenan", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(5.74,6.93,51.28,12.39,2.34,0)),
  
  mgl_3_3_1 = data.frame(site = "Glenan", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(1.31,9.44,42.98,9.66,4.84,1.84)),
  mgl_3_3_2 = data.frame(site = "Glenan", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,11,42.72,10.01,4.78,1.57)),
  mgl_3_3_3 = data.frame(site = "Glenan", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(2.03,6.66,45.62,9.36,4.55,1.76)),
  
  mgl_3_4_1 = data.frame(site = "Glenan", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 15.3, 103.43, 29.68, 17.58, 0)),
  mgl_3_4_2 = data.frame(site = "Glenan", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 18.02, 99.19, 29.62, 19.77, 0)),
  mgl_3_4_3 = data.frame(site = "Glenan", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 15.62, 101.9, 29.12, 19.03, 0)),
  
  #----Belle Ile----
  mbe_1_1_1 = data.frame(site = "Belle-Ile", point = 1, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0, 4.02, 24.53, 14.02, 6.29, 1.85)),
  mbe_1_1_2 = data.frame(site = "Belle-Ile", point = 1, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0, 4.54, 22.5,14.1,4.82,1.74)),
  mbe_1_1_3 = data.frame(site = "Belle-Ile", point = 1, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0, 2.46,24,14.97,6.43,2.87)),
  
  mbe_1_2_1 = data.frame(site = "Belle-Ile", point = 1, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.85,10.82,13.76,10.51,1.55)),
  mbe_1_2_2 = data.frame(site = "Belle-Ile", point = 1, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,1.86,13.52,12.59,8.78,1.8)),
  mbe_1_2_3 = data.frame(site = "Belle-Ile", point = 1, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.97,13.06,14.15,8.47,1.87)),
  
  mbe_1_3_1 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,14.15,6.91,0.56,0)),
  mbe_1_3_2 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,12.68,7.98,0.91,0)),
  mbe_1_3_3 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0,12.08,8.47,0.99,0)),
  
  mbe_1_4_1 = data.frame(site = "Belle-Ile", point = 1, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.38,68.93,5.43,0.29,0)),
  mbe_1_4_2 = data.frame(site = "Belle-Ile", point = 1, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,10.6,64.32,6.79,0.34,0)),
  mbe_1_4_3 = data.frame(site = "Belle-Ile", point = 1, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,11.04,62.71,7.88,0.37,0)),
  
  mbe_2_1_1 = data.frame(site = "Belle-Ile", point = 2, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(1,9.35,28.76,14.94,7.46,3.03)),
  mbe_2_1_2 = data.frame(site = "Belle-Ile", point = 2, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,9.94,28.5,17.21,6.68,2.17)),
  mbe_2_1_3 = data.frame(site = "Belle-Ile", point = 2, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,9.7,30.71,14.06,7.6,2.37)),
  
  mbe_2_2_1 = data.frame(site = "Belle-Ile", point = 2, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.52,9.3,6.67,0.12,0)),
  mbe_2_2_2 = data.frame(site = "Belle-Ile", point = 2, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.55,8.6,6.58,0.79,0.21)),
  mbe_2_2_3 = data.frame(site = "Belle-Ile", point = 2, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,0.8,8.44,5.95,1.43,0)),
  
  mbe_2_3_1 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mbe_2_3_2 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mbe_2_3_3 = data.frame(site = "Belle-Ile", point = 1, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mbe_2_4_1 = data.frame(site = "Belle-Ile", point = 2, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mbe_2_4_2 = data.frame(site = "Belle-Ile", point = 2, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = NA),
  mbe_2_4_3 = data.frame(site = "Belle-Ile", point = 2, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = NA),
  
  mbe_3_1_1 = data.frame(site = "Belle-Ile", point = 3, echantillon = 1, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.44,17.18,2.08,0,0)),
  mbe_3_1_2 = data.frame(site = "Belle-Ile", point = 3, echantillon = 1, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,3.5,18.13,2.06,0,0)),
  mbe_3_1_3 = data.frame(site = "Belle-Ile", point = 3, echantillon = 1, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(0,4.61,17.57,1.44,0,0)),
  
  mbe_3_2_1 = data.frame(site = "Belle-Ile", point = 3, echantillon = 2, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(1.24,8.26,29.81,1.13,0,0)),
  mbe_3_2_2 = data.frame(site = "Belle-Ile", point = 3, echantillon = 2, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(1.12,7.38,29.73,1.87,0.19,0.04)),
  mbe_3_2_3 = data.frame(site = "Belle-Ile", point = 3, echantillon = 2, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(.76,6.56,30.38,2.63,0.1,0)),
  
  mbe_3_3_1 = data.frame(site = "Belle-Ile", point = 3, echantillon = 3, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.44,22.61,13.23,2.6,0.7)),
  mbe_3_3_2 = data.frame(site = "Belle-Ile", point = 3, echantillon = 3, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(0,7.19,21.66,12.62,3.79,1.1)),
  mbe_3_3_3 = data.frame(site = "Belle-Ile", point = 3, echantillon = 3, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(1.69,5.92,23.34,10.82,3.7,0.89)),
  
  mbe_3_4_1 = data.frame(site = "Belle-Ile", point = 3, echantillon = 4, replicat = 1, fraction = c(16,10,5,4,3.15,2), poids = c(NA)),
  mbe_3_4_2 = data.frame(site = "Belle-Ile", point = 3, echantillon = 4, replicat = 2, fraction = c(16,10,5,4,3.15,2), poids = c(NA)),
  mbe_3_4_3 = data.frame(site = "Belle-Ile", point = 3, echantillon = 4, replicat = 3, fraction = c(16,10,5,4,3.15,2), poids = c(NA))

)

  #----tab final----
tableau_fractions_2023 <- bind_rows(full, .id = "code") %>% #creation du tableau final
  mutate_if(is.character, as.factor) %>% #changer tout ce qui est un character (texte) en vecteur
  mutate(fraction = as.factor(fraction)) %>%   #changer la colonne fraction de numerique à facteur
  mutate(year = 2023) %>%
  filter(fraction != 2) #remove fraction 2 useless 

#----2022----  

full_2022 <- list(
  mbe_1_4_1 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.31, 3.14, 48.82, 39.65, 43.29)
  ),
  mbe_1_4_2 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.01, 44.28, 40.55, 46.77)
  ),
  mbe_1_4_3 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.69, 53.48, 34.02, 44.42)
  ),
  
  mbe_2_4_1 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.14, 25.92, 83.57, 33.08, 17.02)
  ),
  mbe_2_4_2 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(6.13, 19.11, 80.59, 32.11, 26.05)
  ),
  mbe_2_4_3 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(5.81, 22.52, 73.86, 36.96, 19.98)
  ),
  
  mbe_3_4_1 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.84, 9.78, 34.07, 22.8, 22.72)
  ),
  mbe_3_4_2 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(5.33, 7.75, 34.79, 21.12, 22.59)
  ),
  mbe_3_4_3 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(4.27, 9.82, 33.8, 16.89, 22.39)
  ),
  
  mme_1_4_1 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.46, 5.27, 20.24, 8.2, 5.94)
  ),
  mme_1_4_2 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.6, 9.32, 23.43, 7.28, 4.43)
  ),
  mme_1_4_3 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.33, 9.92, 16.97, 7.8, 5.14)
  ),
  
  mme_2_4_1 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.42, 4.27, 26.33, 16.64, 14.45)
  ),
  mme_2_4_2 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.45, 6.77, 28.82, 13.57, 12.20)
  ),
  mme_2_4_3 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.43, 8.10, 24.62, 15.39, 11.97)
  ),
  
  mme_3_4_1 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.87, 14.36, 51.74, 22.71, 15.40)
  ),
  mme_3_4_2 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(5.49, 10.91, 48.44, 22.93, 17.16)
  ),
  mme_3_4_3 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.22, 13.46, 52.90, 21.88, 12.51)
  ),
  
  mrz_1_4_1 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 2.85, 61.22, 14.4, 8.61)
  ),
  mrz_1_4_2 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.61, 2.86, 63.01, 12.67, 8.83)
  ),
  mrz_1_4_3 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 3.88, 58.83, 16.07, 5.93)
  ),
  
  mrz_2_4_1 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.94, 5.48, 52.28, 18.78, 8.57)
  ),
  mrz_2_4_2 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 3.82, 62.16, 14.69, 4.99)
  ),
  mrz_2_4_3 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.79, 7.31, 56.56, 15.62, 5.1)
  ),
  
  mrz_3_4_1 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(11.18, 52.56, 131.23, 19.35, 12.01)
  ),
  mrz_3_4_2 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(15.48, 47.88, 132.74, 17.67, 10.19)
  ),
  mrz_3_4_3 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(NA, NA, NA, NA, NA)
  ),
  
  mbk_1_4_1 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.21, 19.47, 31.50, 3.82, 1.42)
  ),
  mbk_1_4_2 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(6.48, 19.83, 33.43, 4.97, 1.45)
  ),
  mbk_1_4_3 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(4.87, 15.05, 31.75, 4.35, 0.96)
  ),
  
  mbk_2_4_1 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(9.24, 20.08, 79, 13.74, 8.55)
  ),
  mbk_2_4_2 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(6.28, 29.64, 71.58, 21.51, 0.79)
  ),
  mbk_2_4_3 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(6.64, 18.85, 80.48, 22.39, 0.21)
  ),
  
  mbk_3_4_1 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(17.2, 68.58, 152.96, 21.57, 12.95)
  ),
  mbk_3_4_2 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(32.59, 51.29, 149.56, 23.74, 13.72)
  ),
  mbk_3_4_3 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(39.43, 55.16, 141.26, 24.47, 12.30)),
  
  mmo_3_4_1 = data.frame(
      site = "Molene",
      point = 3,
      echantillon = 4,
      replicat = 1,
      fraction = c(16, 10, 5, 4, 3.15),
      poids = c(0, 13.42, 36.54, 9.32, 3.88)
    ),
    mmo_3_4_2 = data.frame(
      site = "Molene",
      point = 3,
      echantillon = 4,
      replicat = 2,
      fraction = c(16, 10, 5, 4, 3.15),
      poids = c(0, 12.59, 34.51, 10.76, 4.36)
    ),
    mmo_3_4_3 = data.frame(
      site = "Molene",
      point = 3,
      echantillon = 4,
      replicat = 3,
      fraction = c(16, 10, 5, 4, 3.15),
      poids = c(0, 14.94, 32.84, 10.25, 3.73)
    ),
  
  mcm_3_4_1 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.59, 16.33,26.94,6.32,6.13)
  ),
  mcm_3_4_2 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.58,16.34,27.69,6.10,4)
  ),
  mcm_3_4_3 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.78,19.07,24.62,5.64,4.94)
  ),
  
  mgl_1_4_1 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.59,16.33,26.94,6.32,3.13)
  ),
  mgl_1_4_2 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.58,16.34,27.69,6.10,4)
  ),
  mgl_1_4_3 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(.78,19.07,24.62,5.64,4.94)
  ),
  mmo_1_4_1 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(31.25,42.02,61.47,6.05,1.79)
  ),
  mmo_1_4_2 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(29.87,45.49,59.68,5.36,1.32)
  ),
  mmo_1_4_3 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(29.48,42.54,60.28,7.04,1.83)
  ),
  mcm_1_4_1 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(4.03,4.97,12.23,4.95,1.61)
  ),
  mcm_1_4_2 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(3.9,4.94,12.15,4.75,1.55)
  ),
  mcm_1_4_3 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(3.96,4.95,12.16,4.59,1.34)
  ),
  mgl_2_4_1 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.64,.68,29.18,36.89,34.48)
  ),
  mgl_2_4_2 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,3.19,29.28,34.67,31.68)
  ),
  mgl_2_4_3 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.68,0,27.88,34.69,30.87)
  ),
  
  mpp_1_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(11.35,40.12,54.32,7.81,2.32)
  ),
  mpp_1_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(11.38,37.56,58.18,6.44,1.87)
  ),
  mpp_1_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(14.16,36.5,56.72,6.11,1.77)
  ),
  
  mmo_2_4_1 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(4.75,33.8,63.58,15.46,6.32)
  ),
  mmo_2_4_2 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(4.73,33.06,64.03,14.53,5.99)
  ),
  mmo_2_4_3 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(.91,35.38,63.24,15.48,6.47)
  ),
  
  mcm_2_4_1 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,7.23,23.3,4.61,3.3)
  ),
  mcm_2_4_2 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,7.89,24.56,5.8,2.83)
  ),
  mcm_2_4_3 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,6.81,22.48,5.07,3.46)
  ),
  
  mpp_2_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(22.24,30.67,39.65,12.53,9.73)
  ),
  mpp_2_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(25.38,24.62,61.96,13.81,8.01)
  ),
  mpp_2_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(15.13,39.42,57.28,14.27,7.56)
  ),
  
  mpp_3_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(13.29,27.75,91.86,25.7,15.26)
  ),
  mpp_3_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(13.3,35.4,92.06,19.95,10.84)
  ),
  mpp_3_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(13.18,31.23,95.59,19.55,10.94)
  )
  )
  
  

  #----tableau final----
tableau_fractions_2022 <- bind_rows(full_2022, .id = "code") %>% #creation du tableau final
  mutate_if(is.character, as.factor) %>% #changer tout ce qui est un character (texte) en vecteur
  mutate(fraction = as.factor(fraction)) %>%   #changer la colonne fraction de numerique à facteur
  mutate(year = 2022)


#----2019----
full_2019 <- list(
  mrz_2_4_1 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, .86 + 2.87, 23.94, 18.88, 25.02)
  ),
  mrz_2_4_2 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0.91, 2.56 + 2.87, 37.02, 13.56, 23.45)
  ),
  mrz_2_4_3 = data.frame(
    site = "Rozegat",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.07, 2.45 + 2.87, 29.49, 20.71, 24.48)
  ),
  
  mtr_2_4_1 = data.frame(
    site = "Trevignon",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(25.89 + 22.98, 32.99, 29.23, 8.92, 4.67)
  ),
  mtr_2_4_2 = data.frame(
    site = "Trevignon",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(15.15 + 22.98, 37.62, 33.43, 9.99, 4.98)
  ),
  mtr_2_4_3 = data.frame(
    site = "Trevignon",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(24.12 + 22.98, 26.99, 37.07, 8.54, 4.36)
  ),
  
  mbk_1_4_1 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,21.85,106.47,30.12,13.77)
  ),
  mbk_1_4_2 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,23.2,117.8,18.31,10.12)
  ),
  mbk_1_4_3 = data.frame(
    site = "Keraliou",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,21.87,106.18,19.18,18.18)
  ),
  mbk_2_4_1 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,79.38,105.42,15.64,14.36)
  ),
  mbk_2_4_2 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,28.12,123.17,17.87,14.62)
  ),
  mbk_2_4_3 = data.frame(
    site = "Keraliou",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,27.65,120.35,19.84,15.11)
  ),
  mbk_3_4_1 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.31,26.68,189.97,33.99,22.25)
  ),
  mbk_3_4_2 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.08,31.04,175.69,29.36,28.49)
  ),
  mbk_3_4_3 = data.frame(
    site = "Keraliou",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(2.07,29.01,190.19,20.85,20.97)
  ),
  mmx_2_4_1 = data.frame(
    site = "Morlaix",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,.86,35.31,18.94,25.62)
  ),
  mmx_2_4_2 = data.frame(
    site = "Morlaix",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,.92,36.04,25.29,19.20)
  ),
  mmx_2_4_3 = data.frame(
    site = "Morlaix",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,1.35, 39.26, 21.14, 17.33)
  ),
  mtr_1_4_1 = data.frame(
    site = "Trevignon",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 17.68, 110, 21.97, 21.39)
  ),
  mtr_1_4_2 = data.frame(
    site = "Trevignon",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 21.53, 96.90, 26.18, 22.52)
  ),
  mtr_1_4_3 = data.frame(
    site = "Trevignon",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 23.59, 88.43, 35.8, 21.23)
  ),
  mmx_3_4_1 = data.frame(
    site = "Morlaix",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.87, 9.38, 7.71, 7.12)
  ),
  mmx_3_4_2 = data.frame(
    site = "Morlaix",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.86, 8.39, 8.17, 6.54)
  ),
  mmx_3_4_3 = data.frame(
    site = "Morlaix",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.84, 8.11, 7.6, 5.78)
  ),
  mbe_2_4_1 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 13.9, 53.64, 34.01, 37.66)
  ),
  mbe_2_4_2 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 15.96, 52.37, 36.21, 30.17)
  ),
  mbe_2_4_3 = data.frame(
    site = "Belle-Ile",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 15.96, 52.37, 36.21, 30.17)
  ),
  mmx_1_4_1 = data.frame(
    site = "Morlaix",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.64, 21.65, 11.53, 9.1)
  ),
  mmx_1_4_2 = data.frame(
    site = "Morlaix",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.44, 22.02, 10.07, 9.44)
  ),
  mmx_1_4_3 = data.frame(
    site = "Morlaix",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.57, 24.89, 9.63, 7.47)
  ),
  mpp_1_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,6.81, 41.4, 15.4, 7.89)
  ),
  mpp_1_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 10.03, 40.70, 14.17, 8.18)
  ),
  mpp_1_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 11, 33.6, 18.18, 8.16)
  ),
  mpp_3_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(10.16, 13.37, 34.19, 15.48, 11.52)
  ),
  mpp_3_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(10.83, 12.74, 35.63, 14.56, 10.7)
  ),
  mpp_3_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(10.8, 14.19, 35.6, 12.13, 9.98)
  ),
  mbe_3_4_1 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 10.27, 35.43, 22.54, 25.45)
  ),
  mbe_3_4_2 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 8.45, 37.58, 23.4, 22.65)
  ),
  mbe_3_4_3 = data.frame(
    site = "Belle-Ile",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 8.63, 37.64, 21.83, 27.57)
  ),
  mrz_1_4_1 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.49, 74.82, 49.73, 39.01)
  ),
  mrz_1_4_2 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 6.59, 79.43, 39.57, 50.22)
  ),
  mrz_1_4_3 = data.frame(
    site = "Rozegat",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.25, 83.37, 42.52, 37.38)
  ),
  mrz_3_4_1 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.05, 37.49, 17.77, 10.35)
  ),
  mrz_3_4_2 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.32, 59.44, 17.29, 8.65)
  ),
  mrz_3_4_3 = data.frame(
    site = "Rozegat",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.36, 56.44, 17.46, 11.08)
  ),
  mpp_2_4_1 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(12.28, 29.24, 48.71, 16.48, 15.1)
  ),
  mpp_2_4_2 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(13.49, 28.22, 47.15, 20.83, 12.77)
  ),
  mpp_2_4_3 = data.frame(
    site = "Saint-Brieuc",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(9.47, 25.24, 52.54, 18.21, 14.4)
  ),
  mgl_2_4_1 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 2.2, 58.33, 32.47, 41.28)
  ),
  mgl_2_4_2 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 0.76, 47.94, 45.23, 48.08)
  ),
  mgl_2_4_3 = data.frame(
    site = "Glenan",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.31, 49.07, 46.33, 43.45)
  ),
  mgl_1_4_1 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, .95, 36.06, 50.62, 69.44)
  ),
  mgl_1_4_2 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.86, 30.38, 49.36, 66.35)
  ),
  mgl_1_4_3 = data.frame(
    site = "Glenan",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.35, 28.86, 48.98, 65.38)
  ),
  mgl_3_4_1 = data.frame(
    site = "Glenan",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 2.71, 16.73, 37.05, 38.06)
  ),
  mgl_3_4_2 = data.frame(
    site = "Glenan",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 2.73, 23.7, 27.67, 41.51)
  ),
  mgl_3_4_3 = data.frame(
    site = "Glenan",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 2.74, 19.91, 33.15, 43.56)
  ),
  mmo_1_4_1 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.6, 6.67, 64.52, 24.96, 14.58)
  ),
  mmo_1_4_2 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.61, 5.25, 62.47, 23.54, 18.82)
  ),
  mmo_1_4_3 = data.frame(
    site = "Molene",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(1.51, 5.95, 67.89, 17.45, 19.65)
  ),
  mtr_3_4_1 = data.frame(
    site = "Trevignon",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(11.94, 27.96, 43.68, 12.49, 12.54)
  ),
  mtr_3_4_2 = data.frame(
    site = "Trevignon",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(16.19, 25.40, 40.15, 14.40, 15.98)
  ),
  mtr_3_4_3 = data.frame(
    site = "Trevignon",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(13.44, 30.31, 39.93, 14.59, 12.14)
  ),
  mmo_3_4_1 = data.frame(
    site = "Molene",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 4.73, 55.04, 18.84, 20.69)
  ),
  mmo_3_4_2 = data.frame(
    site = "Molene",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.14, 47.25, 25.23, 20.50)
  ),
  mmo_3_4_3 = data.frame(
    site = "Molene",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 6.28, 48.61, 21.55, 19.82)
  ),
  mcm_3_4_1 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 0, 1.28, 1.68, 3.34)
  ),
  mcm_3_4_2 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 0, 1.51, 1.17, 4.58)
  ),
  mcm_3_4_3 = data.frame(
    site = "Camaret",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 0, 1.59, 1.16, 1.88)
  ),
  mme_1_4_1 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,.58,22.11,8.32,5.4)
  ),
  mme_1_4_2 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,1.48,20.17,8.51,5.99)
  ),
  mme_1_4_3 = data.frame(
    site = "Meaban",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0,1.62,19.85,7.53,6.57)
  ),
  mme_3_4_1 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 11.09, 67.75, 23.5, 19.03)
  ),
  mme_3_4_2 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 8.59, 68.58, 20.73, 22.16)
  ),
  mme_3_4_3 = data.frame(
    site = "Meaban",
    point = 3,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.47, 65.78, 24.75, 20.78)
  ),
  mmo_2_4_1 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, .91, 23.13, 11.77, 13.89)
  ),
  mmo_2_4_2 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, .97, 23.65, 12.49, 12.1)
  ),
  mmo_2_4_3 = data.frame(
    site = "Molene",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 1.9, 20.28, 13.45, 14.01)
  ),
  mme_2_4_1 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 8.38, 25.64, 9.93, 9.49)
  ),
  mme_2_4_2 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.4, 27.43, 9.62, 9.45)
  ),
  mme_2_4_3 = data.frame(
    site = "Meaban",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.14, 27.32, 9.88, 9.14)
  ),
  mbe_1_4_1 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 9.4, 34.3, 21.61, 22.29)
  ),
  mbe_1_4_2 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.48, 30.12, 27.64, 21.7)
  ),
  mbe_1_4_3 = data.frame(
    site = "Belle-Ile",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 8.44, 29.59, 21.89, 22.77)
  ),
  mcm_2_4_1 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 6.32, 24.97, 5.78, 5.28)
  ),
  mcm_2_4_2 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 7.21, 23.79, 6.47, 4.6)
  ),
  mcm_2_4_3 = data.frame(
    site = "Camaret",
    point = 2,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.17, 25.22, 5.49, 5.76)
  ),
  mcm_1_4_1 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 1,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.71, 25.75, 10.58, 12.42)
  ),
  mcm_1_4_2 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 2,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 5.71, 25.75, 10.58, 12.42)
  ),
  mcm_1_4_3 = data.frame(
    site = "Camaret",
    point = 1,
    echantillon = 4,
    replicat = 3,
    fraction = c(16, 10, 5, 4, 3.15),
    poids = c(0, 3.43, 38.89, 12.08, 12.37)
  )
)

tableau_fractions_2019 <- bind_rows(full_2019, .id = "code") %>% #creation du tableau final
  mutate_if(is.character, as.factor) %>% #changer tout ce qui est un character (texte) en vecteur
  mutate(fraction = as.factor(fraction)) %>%   #changer la colonne fraction de numerique à facteur
  mutate(year = 2019)
#----tableau 2019-2023----
tableau_fractions <- tableau_fractions_2023 %>% 
  bind_rows(tableau_fractions_2022) %>% 
  bind_rows(tableau_fractions_2019)
save(tableau_fractions, file = "data/fractions2023.Rdata")
