xvfb-run -a python3 src/train.py --seed 0 \
 --domain_name walker --task_name walk --algorithm sac \
 --pretrain True --pretrain_dir logs/walker_stand/sac/0/model \
 --pretrain_steps 500000 --pretrain_task_name stand