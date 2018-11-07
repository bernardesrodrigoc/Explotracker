# Explotracker

**Description**

An R function to determine the exploration of animals in a given area, using the coordinates of the walking trajectory, which are usually obtained by tracking software.

Algorithm developed and published in Journal Crop Protection.

Paper title : Walking activity and dispersal on deltamethrin- and spinosad-treated grains by the maize weevil Sitophilus zeamais

_________________________________________________________________________________________________________________________________________________________________

Authors:

  - PhD Mayra Vélez (Universidad Técnica Estatal de Quevedo, Quevedo, Los Ríos, Ecuador).
  
  - M.Sc Rodrigo Cupertino Bernardes (Federal University of Vicosa). *function developer*. Email: bernardesrodrigoc@gmail.com
  
  - PhD Wagner Faria Barbosa (Federal University of Vicosa).
  
  - PhD Jardel C. Santos (Federal University of Vicosa).
  
  - PhD Raul Narciso Carvalho Guedes (Federal University of Vicosa).

_________________________________________________________________________________________________________________________________________________________________

This function was developed in R software (R Core Team, version 3.4.4., 2018)

This repository contains

  + Source Code: This folder contains the file of source code.
  
_________________________________________________________________________________________________________________________________________________________________

**Instructions for use**

You can download the **explotracker** file that is inside the Source Code folder. Save the file in the directory you want. In the R Console use the following command to load the function:

source("directory path where the function was saved/explotracker.R")

_________________________________________________________________________________________________________________________________________________________________

**Usage**

explotracker(quaxmin=NULL, quaxmax=NULL, quaymin=NULL, quaymax=NULL,quanumber=NULL,minvalue=0,maxvalue=600, Scale=100,showtime=T,showscalevalue = T,graphic=F, color=c("yellow","red","blue"),writetable = F,readtable=F,table="time.txt")

**Arguments**
