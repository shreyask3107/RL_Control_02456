# 02456 Deep Learning Course Project: Task Adaptation for Continuous Control using Deep Reinforcement Learning


## Algorithms

This repository contains implementations of the following algorithms in a unified framework:

- [SVEA (Hansen et al., 2021)](https://arxiv.org/abs/2107.00644) on raw-pixels
- [SAC + AE (Denis et al., 2020)](https://arxiv.org/abs/1910.01741) on raw-pixels
- [SAC (Haarnoja et al., 2018)](https://arxiv.org/abs/1812.05905) on state-derived-features

using standardized architectures and hyper-parameters, wherever applicable. If you want to add an algorithm, feel free to send a pull request.

## Setup
We assume that you have access to a GPU with CUDA >=9.2 support. All dependencies for pixel related experiments can then be installed with the following commands:

```
conda env create -f raw-pixel-input/setup/conda.yml
conda activate dmcgb
sh raw-pixel-input/setup/install_envs.sh
```

## Training & Evaluation

The `` directory contains training and evaluation bash scripts for all the included algorithms. Alternatively, you can call the python scripts directly, e.g. for training call

```
python3 src/train.py \
  --algorithm svea \
  --seed 0
```

to run SVEA on the default task, `walker_walk`. This should give you an output of the form:

```
Working directory: logs/walker_walk/svea/0
Evaluating: logs/walker_walk/svea/0
| eval | S: 0 | ER: 26.2285 | ERTEST: 25.3730
| train | E: 1 | S: 250 | D: 70.1 s | R: 0.0000 | ALOSS: 0.0000 | CLOSS: 0.0000 | AUXLOSS: 0.0000
```
where `ER` and `ERTEST` corresponds to the average return in the training and test environments, respectively. You can select the test environment used in evaluation with the `--eval_mode` argument, which accepts one of `(train, color_easy, color_hard, video_easy, video_hard, distracting_cs, none)`. Use `none` if you want to disable continual evaluation of generalization. Note that not all combinations of arguments have been tested. Feel free to open an issue or send a pull request if you encounter an issue or would like to add support for new features.


## Results



# Soft Actor-Critic (SAC) implementation in PyTorch

This is PyTorch implementation of Soft Actor-Critic (SAC) [[ArXiv]](https://arxiv.org/abs/1812.05905).

If you use this code in your research project please cite us as:
```
@misc{pytorch_sac,
  author = {Yarats, Denis and Kostrikov, Ilya},
  title = {Soft Actor-Critic (SAC) implementation in PyTorch},
  year = {2020},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/denisyarats/pytorch_sac}},
}
```

## Requirements
We assume you have access to a gpu that can run CUDA 9.2. Then, the simplest way to install all required dependencies is to create an anaconda environment and activate it:
```
conda env create -f conda_env.yml
source activate pytorch_sac
```

## Instructions
To train an SAC agent on the `cheetah run` task run:
```
python train.py env=cheetah_run
```
This will produce `exp` folder, where all the outputs are going to be stored including train/eval logs, tensorboard blobs, and evaluation episode videos. One can attacha tensorboard to monitor training by running:
```
tensorboard --logdir exp
```

## Results
An extensive benchmarking of SAC on the DM Control Suite against D4PG. We plot an average performance of SAC over 3 seeds together with p95 confidence intervals. Importantly, we keep the hyperparameters fixed across all the tasks. Note that results for D4PG are reported after 10^8 steps and taken from the original paper.
![Results](figures/dm_control.png)
