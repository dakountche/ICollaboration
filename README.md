
# Interactive Scientific Collaboration


# Introduction

This project was born after many scientific paper reviews.
The design goals are:
   - to share how one understands a paper
   - to quickly prototype the methods described in the paper at hand using for
   example Python or a programming language supported by Jupyter
   - to test new hypothesis and write new papers
   - to applying Machine Learning tools on the generated notebooks
   - to contibute to research reproducibility as in [1].

Jupyter was chosen to serve as the framework for scientific paper reviews.

This document first describes:
   - An anatomy of a scientific paper
   - How to install the necessary tools for using Jupyter in this context
     for example using Docker
   - How to use the existing notebooks

The following  installation procedure are proposed:

    1.  Anaconda
    2.  pip and virtualenv
    3.  Docker

The choice of the appropriate installation method depends on the specific needs.
Also, these methods have been tested only on GNU/Linux.

# Anantomy of a Scientific paper

Many schemes (see [2]-[5]) have been proposed for how to oraganize a paper
or how to read it (fast). Definitly, one needs a method to be able to keep up
with the pace of publications which is one of the purposes of this project.

The following organization is chosen for a paper:
    - the title: the original paper's title
    - abstract: short summary of the paper
    - the problem studied
    - the solution proposed
    - the experimentations
    - observations of the reader
    - a way of translating new English words in the language of the reader
These sections contain a summary from the reader's perspective.
Also these sections lead to the creation of a Jupyter notebook consider as a template.

# Installation of the tools

## Anaconda

See: https://docs.continuum.io/anaconda/install

After the installation, type the following command:

```bash
docker run -i -t -p 8888:8888 -v reviews:/opt/reviews  \
icollaboration /bin/bash -c "/opt/conda/bin/conda install jupyter -y &&\
/opt/conda/bin/conda create -n ipykernel_py2 python=2 ipykernel &&\
/opt/conda/bin/jupyter notebook --notebook-dir=/opt/reviews --ip='*' \
--port=8888 --no-browser "
```


## Python requirements

Another method is to use a Python requirements file like the one provided with
the project. It contains Jupyter and other libraries such as numpy and scipy.
Assuming that Python 3 is the installed Python version, the installation
is done by typing:

```bash
$ cd install/python
$ ./install.sh
```

After the installation, Jupyter can be launched by typing in the install/python:

```bash
$ source icollaboration/bin/activate
$ cd ../../reviews
$ jupyter notebook
```

## Docker

### Using the Dockerfile
This method requires, to have Docker installed. Optionally, docker-compose can
be used. It will only used the anaconda distribution in a Docker container.
The installation is done by typing in the docker folder:

```bash
$ cd docker/anaconda
$./build.sh
```
This script will install the anaconda3 docker image. It might be necessary
to become root or add the current user to the docker group by typing:

```bash
# usermod -a -G docker $current-user
```


After the image is built, simply :
- Edit the script to insert the path to the reviews directory
- and type:

```bash
cd docker/anaconda
$ ./run.sh
```

### Using Docker Compose

Another approach with Docker, is the use of docker-compose. A compose file is
already provided with services:

- Anadonda
- RabbitMQ
- Mininet

For installing the tools using this method, simply type:

```bash
$ docker-compose up
```

The first time, all the necessary tools will be installed. Subsequent
typing will launch the services and expose the port.
For example, connection is possible on http://localhost:8888



# Interactive Collaboration using this approach

After the installation, you can connect to http://localhost:8888

Which shows the root tree:
 - data : the datasets used in the original papers
 - install: folder containing installation methods
 - resources: images
 - reviews: containing the notebooks organised form the research fields
 - Template.ipynb: the Template used to create all the notebooks
 - README.md: this readme.


## Using the existing notebooks

The existing notebooks were made on papers related to privacy, security
and networking in Cooperative Intelligent Transportation Systems (C-ITS).
These notebooks can be accessed by navigating through the review directory.


## Creating new notebooks from the Template

To create a new paper reviews:
1. Open Template.ipynb in Jupyter
2. Click on File -> Make a Copy
3. Save and mane the copy

The newly created notebook can then be used to review the paper at hand.
Python is choosen for  reproducing the results given in the paper being reviewed.
However, many languages can be used provided the kernel is supported in Jupyter.


# Conclusion
This approach was designed for quick prototyping and exchange between researchers.
It requires to take the time to carefully review important papers and share their essence.

Feel free to improve and share with us your work.


# See also

* [1] https://github.com/alegrand/RR_webinars
* [2] https://www.sciencemag.org/careers/2016/01/how-read-scientific-paper
* [3] https://www.sciencemag.org/careers/2016/03/how-seriously-read-scientific-paper
* [4] https://www.elsevier.com/connect/infographic-how-to-read-a-scientific-paper
* [5] http://www.research4life.org/training/part_a_how_to_read_a_scientific_paper_2014_06/
