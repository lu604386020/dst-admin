#!/bin/bash

master="$HOME/.klei/DoNotStarveTogether/MyDediServer/Master/"
cave="$HOME/.klei/DoNotStarveTogether/MyDediServer/Caves/"

dst_dir=(${master} ${cave})
dst_name=("Master" "Caves")
dst_zh=("地上" "洞穴")
dst_sh=("overworld" "cave")

#　启动
start(){
    cd ~/dst/bin
    # dst=${dst_dir[$1]}
    if [[ -z `ps -ef | grep -v grep |grep -v "dst.sh"|grep ${dst_name[$1]}|sed -n '1P'|awk '{print $2}'` ]]; then
		screen -dm sh ${dst_sh[$1]}.sh && if [[ `echo $?` -eq 0 ]]; 
		then
			echo -e "\033[36m ##: ${dst_zh[$1]}启动成功~ \033[0m"
		fi
	else
		echo -e "\033[31m !!!${dst_zh[$1]}正在运行中!!! \033[0m"
	fi
}

# 停止
stop(){
	ps -ef|grep ${dst_name[$1]}|awk '{print $2}'|xargs kill -9
	if [[ -z `ps -ef | grep -v grep |grep -v "dst.sh"|grep ${dst_name[$1]}|sed -n '1P'|awk '{print $2}'` ]]; then
		echo  -e "\033[32m ##: ${dst_zh[$1]}已停止... \033[0m"
	fi
}


main(){
	stop 0
	start 0
}

main $1




