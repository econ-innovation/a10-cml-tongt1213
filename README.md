[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/s21HnKWV)
# Assignment10_cml

1. 写一段bash脚本来发送一封邮件到公邮。

推荐工具msmtp；参考资料：https://wiki.archlinux.org/title/msmtp

2. 在获取谷歌专利文本时，如果把所有输出文件都放在同一个路径当中，将会给文件系统带来沉重的负担，甚至无法方便打开文件夹，更别说后续操作。因此，我们需要把任务设计地更细致。我们设计一个文件储存的架构，每100个文件储存在一个路径中，然后每
100个文件夹再组成上一级目录，以此类推。写一段脚本实现这个功能。

谷歌专利号数据：bigdata_econ_2023/data/assignment_cml/pubnr_cn.txt
