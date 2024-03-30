#!/bin/bash

# 配置文件与目录路径
patent_file="pubnr_cn.txt"
base_directory="patents"
batch_size=100

# 从指定文件读取专利号
fetch_patent_ids() {
    while IFS= read -r line; do
        echo "$line"
    done < "$1"
}

# 根据专利号创建目录和HTML文件
generate_patent_files() {
    local ids=("$@")
    local directory
    local sub_directory
    local patent_id
    local index=0
    local dir_index
    local sub_dir_index

    # 确保基础目录存在
    [[ ! -d "$base_directory" ]] && mkdir -p "$base_directory"

    for patent_id in "${ids[@]}"; do
        dir_index=$((index / (batch_size * batch_size)))
        directory="${base_directory}/Batch_${dir_index}"

        [[ ! -d "$directory" ]] && mkdir -p "$directory"

        sub_dir_index=$((index / batch_size))
        sub_directory="${directory}/Sub_${sub_dir_index}"
        [[ ! -d "$sub_directory" ]] && mkdir -p "$sub_directory"

        # 使用curl命令获取专利页面内容
        patent_url="https://patents.google.com/patent/${patent_id}"
        target_file="${sub_directory}/${patent_id}.html"
        curl -k "$patent_url" -o "$target_file"

        ((index++))
    done
}

# 执行主逻辑
mapfile -t patent_ids < <(fetch_patent_ids "$patent_file")
generate_patent_files "${patent_ids[@]}"

