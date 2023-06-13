# **Sionna's Tutorial codes**
If you for any reason need to configure the graphic card acess for TensorFlow, follow these steps.
I like to use anaconda package manager for organize my virtual environment, if you don't like the snake, ignore this tutorial.

First thing first: create a conda environment

```
conda create --name tf python=3.9 cudatoolkit=11.8.0
```

it is important that the cuda 12.1.1-3 package (https://archlinux.org/packages/extra/x86_64/cuda/) is installed on your machine.
Once you have the environment installed, call ``conda activate tf``` in your terminal.

Check that pip is installed on the env. (Inevitably we will fall into Python's dependence hell) and then do
```
python3 -m pip install nvidia--cudnn-cu11=8.6.0.163 tensorflow==2.12.*
```
It is paramount that tensorflow and these libraries are in these versions.

> If tensorflow updates, see https://www.tensorflow.org/install/pip and pray.

and now, in your terminal, type the command

```
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
source $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
```

This will create the configuration for tensorflow to be able to see your GPU. Are we done? Of course not, there is no simple setup for Nvidia Linux users.
Before you go any further, it is possible that God has blessed your system and your video card, so check if you have a recognized card, it might be worth rebooting (for luck).

Enter in python env. in terminal
```
python
```
Then:
```
import tensorflow as tf
print(tf.config.list_physical_devices('GPU'))
```

if something like

> [PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]

is returned to you, congratulations, play the lottery.
If it didn't show up, which was my case too, let's go to the magic command.

In python env. in terminal:
```
gpu_devices = tf.config.experimental.list_physical_devices('GPU')
for device in gpu_devices:
    tf.config.experimental.set_memory_growth(device, True)
```
check again if there is a recognized video card, it is worth downloading nvtop, an activity manager on the video card similar to htop.

```
sudo pacman -S nvtop
```

Now, we can install other packages:

```
pip install matplotlib pandas notebook
```

For some reason, sionna uses matplotlib but does not automatically install it on your machine. 
I have put two more library suggestions to help with code development:
> pandas: To collect, move and save simulation data.
> notebook: Jupyter Notebook is a very interesting development tool that can be used for many different purposes (e.g. code modularization or didactic purposes), it depends solely on the user.

For those who are not fans of Jupyter Notebook there is its beautiful cousin, Jupyter Lab

```
pip install jupyterlab
```

to activate jupyter notebook, go to the dependency in your code and

```
jupyter notebook
```

to activate jupyter lab:

```
jupyter-lab
```

I hope this tutorial is useful for other Arch Linux users!

