# Summit 2022 OCTO Keynote Demo!

In this demo we will walk you through how to manage a machine learning application lifecycle on an edge device using a couple of projects developed by Red Hat's Emerging Technologies group. Specifically, Open Data Hub, Microshift and Meteor running on the Operate First Community cloud.

The goal of this project is to demonstrate the development, training and deployment of a real intelligent edge device, an autonomous RV car, via the [Operate First community cloud](https://www.operate-first.cloud/) with resiliency to supply chain attacks.

## The Approach

For this demo we are going to target the autonomous RV car project [DonkeyCar](https://www.donkeycar.com/).

![dokey car ](assets/images/donkeycar-logo-sideways.png)

https://www.donkeycar.com/


The DonkyCar project is, "An opensource DIY self driving platform for small scale cars. RC CAR  +  Raspberry Pi + Python (tornado, keras, tensorflow, opencv, ....)". This project has an active community, as well as open source code, data, and ml models that make it simple for us to develop this demo in an open source and evergreen fashion. Furthermore, the DonkeyCar project has also developed a simulator, so you can try out the vast majority of this demo yourself without the need for a physical car!


### Prerequisites

The infrastructure needed to get started has already been set up for you on the Operate First Community Cloud. This means the donkeycar simulator(tbd), Open Data Hub development resources, git based build pipelines and microshift in a VM that will serve as a digital twin(tbd) to our physical car is already to go (you will have to set up your own physical car, but you can follow our detailed instructions [here](need_detailed_instructions)).


### Access the Development Environment

The First thing you have to do is spin up a data science development environment. This can be done easily by going to https://shower.meteor.zone/ and using the URL for this repo to build a jupyter lab images with all the development requirements installed based on our [Pipfile](../Pipfile).

![meteor](assets/images/meteor-home-page.png)

Once the build is complete, you can then go ahead and spawn the image in the Operate First Community Cloud Jupyter Hub Instance [here](https://jupyterhub-opf-jupyterhub.apps.smaug.na.operate-first.cloud/).

![jupyter_spawner](assets/images/jupyterhub-spawner.png)

### Train Your Own Model

You now have your own Jupyter Lab environment and are ready to start developing a self driving car! From this point you can start to download some datasets, train models, and experiment with different machine learning model architectures!

If you just want to follow along with some existing work, take a look at and run the example notebooks we've used below:

* [Download Data Notebook](../apps/donkeycars/default_car/Download_Data.ipynb)
* [Training Notebook](../apps/donkeycars/default_car/simple_train.ipynb)

### Deploy Your Model

Now that you have a trained self driving car model ready to go, let's get it into our car (or our digital twin)!

This can be done by simply making a Pull Request and getting your new model merged into the upstream repository, then making a new tag release on the repo. The tag release will kick off the automated build pipeline through [Tekton](https://tekton.operate-first.cloud/#/pipelineruns) based on our [Digital Twin Dockerfile](../Dockerfile.donkey) and [RC Car Dockerfile](../Dockerfile.donkey.arm64), creating two new images for us with our new model and push them both to [quay.io](quay.io).

```bash
$ git tag <your release tag>
```
![tekton](assets/images/tekton.png)

Once the images are built and pushed to quay, [ArgoCD](argocd.operate-first.cloud) takes over to deploy the new images on their respective devices, [microshift]( https://microshift.io/) running on a RaspberryPi controlling the physical RC car and microshift running on a NUC controlling the digital twin.


![Sim-Car](assets/images/donkey-sim.png)

Congrats! You've just successfully developed and deployed a self-driving RC car model to the edge with the help of Red Hat's Emerging Technologies group!
