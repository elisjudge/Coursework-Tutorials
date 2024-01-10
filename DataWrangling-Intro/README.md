# Data Wrangling Tutorials

These tutorials are reports that were written as part of my Master Data Science coursework that I decided to upload for others to view and learn from. I do not own the datasets used within these tutorials, however where each dataset was sourced from is cited where applicable.  I am the sole author of the tutorials and the written content within is my own. These notebooks can be run on your machine and you are welcome to reference the code within.

## Tutorial Overview

These tutorials mostly showcase the use of python and popular python libraries such as numpy and pandas, however there are some important data analysis and statisical principles presented alongside these demonstrations.

### Introduction to Python and Jupyter Notebooks

Although this is titled an introduction to Python and Jupyter, a full explanation of each of these does not fit the scope of this tutorial. The main point of this tutorial is to introduce some basic data wrangling concepts and transformations using plain python. Matplotlib is used for visualisations. The report (among the others) is presented in a Jupyter Notebook - which can be considered an introduction to the uninitiated, but should not be relied upon as a full course or guide on how to use Jupyter.

### Numpy Part 1 - Vectors

This tutorial introduces numpy and shows how it can be used to perform exploratory analysis on unidimensional data. Inlcluded within this tutorial is a section on outliers and how numpy can be used to identify them. Being able to manage outliers is a crucial skill for anyone working with data, so you may not want to skip this tutorial.

### Numpy Part 2 - Matrices

This tutorial extends upon the previous tutorial, using numpy to analyse multidimensional data. In addition, this tutorial provides some interesting graphs that can be used to visualize and summarize data where there are multiple variables. It also introduces some basic statistical analysis and transformations that can be used to model relationships between variables, and to describe individual datapoints in your data.

### Pandas Part 1 - DataFrames

This tutorial introduces pandas and demonstrates how it can be used to organise and clean datasets. The important part of the tutorial is the information relating to handling missing data. Missing data is a common issue in the world of Data, so it may prove useful for you.

### Pandas Part 2 - SQL Comparison

This tutorial illustrates how pandas can be used to perform common SQL queries for data wrangling. It also compares the performance of SQL and native pandas, the results of which may aid you in deciding which method you may wish to adopt in your own projects.

## Requirements

### Prerequisites

**Python** : You need Python installed on your machine to run this application. If you don't have Python installed, you can download it from the official Python website: [Python Official Website](https://www.python.org/downloads/)

**Jupyter Notebooks:** You will need to install Juypter (either Juypter Lab or Notebooks) to view these tutorials. If you don't already have this, you can follow the instructions here at the official Jupyter website: [Jupter-Install](https://jupyter.org/install)


## Installation

To run these Jupyter Notebooks on your local machine, you need to follow these steps:

#### 1. Clone the Repository


Now you must likely do not wish to copy the entire repository as it contains other non-related tutorials that you may not be interested in, but if you wish to and have the required space, you may do so. 

However, to clone only this folder, you will need to do the following:

* Open a Bash terminal and change directory to where you want to initialize the repository.

```bash
cd </path/to/folder>
```

*  Initialize the repository.

```bash
git init <repo-name>
```

I recommend calling it Coursework-Tutorials to remain consistent, but I believe you can call the repo whatever you wish on your own system.

* Change directory again into the repository that you just created.

```bash
cd <repo-name>
```

* Clone the repository using the main repository URL. However, make sure to use this command.

```bash
git remote add -f origin <url-goes-here> 
```

v. Enable Sparse Checkout so that you can clone only this folder.

```bash
git config core.sparseCheckout true
```

vi. Set the subfolder that you wish to check out. You can get the relative path to the subfolder by clicking on the folder in github and copying the path.

```bash
echo path/to/subfolder >> .git/info/sparse-checkout
```

vii. Pull these directories into your folder.

```bash
git pull origin main
```

#### 2. Create a Virtual Environment (Highly Recommended)

It's better to work within a virtual environment to avoid contaminating any other projects you may have with the dependencies of these tutorials.

Navigate to the repository main folder (if not already there) and create the environment

```bash
cd <repo-name>
python -m venv venv
```

Then activate the environment.

**On windows:**

```bash
venv\Scripts\activate
```

**On macOS and Linux:**

```bash
source venv/bin/activate
```

#### 3. Install Dependencies

While the virtual environment is active, you can run this to install all the required libraries needed to run the code in the notebooks.

```bash
pip install -r requirements.txt
```

#### 4. Launch Jupyter Notebook

Now you can launch Jupyter Notebook on your machine and view the notebooks.

## Contributions

If you have any improvements or suggestions for these tutorials, please feel free to submit issues or pull requests. Your feedback is valuable and appreciated.
