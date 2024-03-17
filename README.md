# Starter folder

## Overview

This repo provides an analysis to investigate into the top 30 causes of death in Alberta, Canada, from 2001 to 2022, using poisson models and negative binomial regression to assess long-term and emerging causes of death. The negative binomial regression proved particularly effective in handling dispersed data, thereby enhancing outcome predictions. Findings aim to support policymakers and researchers in devising targeted interventions to lower mortality rates and make more informed decisions.



## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data and the simulated data as obtained from Alberta government.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains two fitted models. 
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. It also contains the datasheet. 
-   `scripts` contains the R scripts used to simulate, download, clean and test data. It also contains the R code used to generate models.


## Statement on LLM usage

Aspects of the code were written with the help of the ChatGPT, and the entire chat history is available in inputs/llms/usage.txt. The abstract and introduction were not written with any help of chat tools or auto-complete tools. Grammarly was used to check grammar.
