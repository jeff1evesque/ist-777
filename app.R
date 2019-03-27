##
## app.R
##
if (nzchar(Sys.getenv('RSTUDIO_USER_IDENTITY'))) {
  if (!require('rstudioapi')) install.packages('rstudioapi')
  library('rstudioapi')
}

## set project cwd: only execute in RStudio
if (nzchar(Sys.getenv('RSTUDIO_USER_IDENTITY'))) {
  cwd = dirname(rstudioapi::getSourceEditorContext()$path)
  setwd(cwd)
} else {
  cwd = getwd()
}

## utility functions
if (!require('devtools')) install.packages('devtools', repos='http://cloud.r-project.org')
library('devtools')
devtools::install_local(paste0(cwd, '/packages/customUtility'))
library('customUtility')

## load packages
load_package(c())

## load dataset
allSchoolsReportStatus = read.csv(paste0(cwd, '/data/allSchoolsReportStatus.csv'))
reportSample = read.csv(paste0(cwd, '/data/reportSample.csv'))
usVaccines = read.csv(paste0(cwd, '/data/usVaccines.csv'))
