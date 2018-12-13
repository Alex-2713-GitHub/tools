#!/bin/bash

echo -e "主进程加载中3..."
sleep 1
echo -e "主进程加载中2..."
sleep 1
echo -e "主进程加载中1..."
sleep 1

echo -e "====================================================="
echo -e "|         *         *         *******     *     *   |"
echo -e "|        * *        *         *            *   *    |"
echo -e "|       *   *       *         *             * *     |"
echo -e "|      *     *      *         *****          *      |"
echo -e "|     *********     *         *             * *     |"
echo -e "|    *         *    *         *            *   *    |"
echo -e "|   *           *   *******   *******     *     *   |"
echo -e "====================================================="
echo -e "|-----------欢迎使用Linux软件自动安装服务-----------|"
echo -e "|---------------- 请按照以下方式操作----------------|"
echo -e "|----------如有问题，请联系：131-6527-0713----------|"
echo -e "|----------E-mail：Alex_2713_Office@163.com---------|"
echo -e "====================================================="

isFinish=0

read -p "按任意键进入安装主程序"
echo -e "正在为您初始化必要的插件"
sleep 1
yum -y install vim wget links net-tools

while [ ${isFinish} -eq 0 ] ;do
	echo -e "\t"
	echo -e "\t"
	echo -e "=========================================="
	echo -e "请输入要安装的应用程序id，输入-1则退出安装"
	echo -e "1 基本配置             2 防火墙配置"
	echo -e "3 JDK的安装            4 MySQL的安装"
	echo -e "------------------------------------------"
	read -p "请输入:" projectId
	
	# 1 基本配置
	if [ ${projectId} -eq 1 ]
		then
        	jbpz=0
		while [ ${jbpz} -eq 0 ] ;do
			echo -e "\t"
			echo -e "\t"
			echo -e "\t======================================"
                        echo -e "\t选择服务,-1退出"
			echo -e "\t\t1 升级系统              2 设置主机名"
                        echo -e "\t\t------------------------------------"
			read -p "请输入:" baseOpt

                        if [ ${baseOpt} -eq -1 ]
                                then
                                jbpz=1
                        fi
			if [ ${baseOpt} -eq 1 ]
                                then
                                yum -y update && yum -y upgrade
				read -p "系统升级成功，按任意键继续"
                        fi
			if [ ${baseOpt} -eq 2 ]
                                then
                                read -p "请输入新主机名:" newHostName
				hostnamectl set-hostname ${newHostName}
				read -p "修改成功，重启后生效，是否现在重启?Y/N::" isReboot
				if [ ${isReboot} = "Y" ]
					then
					reboot
				fi
				if [ ${isReboot} = "y" ]
                                        then
                                        reboot
                                fi
                        fi
		done
	fi

	# 2. 防火墙配置
	if [ ${projectId} -eq 2 ]
		then
		fhqlx=0
		while [ ${fhqlx} -eq 0 ] ;do
			echo -e "\t"
			echo -e "\t"
			echo -e "\t================================"
			echo -e "\t选择防火墙类型,-1退出"
			echo -e "\t\t1 iptable          2 firewalld"
			echo -e "\t\t------------------------------"
			read -p "请输入:" firewallType
			
			if [ ${firewallType} -eq -1 ]
				then
				fhqlx=1
			fi

			if [ ${firewallType} -eq 1 ]
				then
				read -p "功能开发中，按任意键继续:"
			fi

			if [ ${firewallType} -eq 2 ]
                                then
				fhqcz=0
				while [ ${fhqcz} -eq 0 ] ;do
					echo -e "\t"
					echo -e "\t"
					echo -e "\t==================================="
                        		echo -e "\t选择操作类型,-1退出"
                        		echo -e "\t\t1 查看状态         2 重启防火墙"
                        		echo -e "\t\t3 打开防火墙       4 关闭防火墙"
                        		echo -e "\t\t5 设为开机启动     6 取消开机启动"
                        		echo -e "\t\t7 开放端口         8 关闭端口"
                        		echo -e "\t\t9 查看开放的端口"
                        		echo -e "\t\t---------------------------------"
                        		read -p "请输入:" firewallOperation
					if [ ${firewallOperation} -eq -1 ]
						then
						fhqcz=1
					fi
					if [ ${firewallOperation} -eq 1 ]
                                                then
                                                systemctl status firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 2 ]
                                                then
                                                systemctl restart firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 3 ]
                                                then
                                                systemctl start firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 4 ]
                                                then
                                                systemctl stop firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 5 ]
                                                then
                                                systemctl enable firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 6 ]
                                                then
                                                systemctl disable firewalld.service
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 7 ]
                                                then
                                                read -p "开放的端口号:" openPort
						firewall-cmd --zone=public --add-port=${openPort}/tcp --permanent
						firewall-cmd --reload
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 8 ]
                                                then
                                                read -p "关闭的端口号:" closePort
						firewall-cmd --zone=public --remove-port=${closePort}/tcp --permanent
						firewall-cmd --reload
						read -p "按任意键继续"
                                        fi
					if [ ${firewallOperation} -eq 9 ]
                                                then
                                                firewall-cmd --zone=public --list-ports
						read -p "按任意键继续"
                                        fi
				done
			fi
		done
        fi

	# 3. JDK的安装
	if [ ${projectId} -eq 3 ]
		then
		echo -e "\t"
		echo -e "\t"
		echo -e "\t======================"
		echo -e "\t请选择JDK的版本"
		echo -e "\t\t 1 1.7         2 1.8"
		echo -e "\t\t--------------------"
		read -p "请输入:" jdkVersion
		
		if [ ${jdkVersion} -eq 1 ]
			then
			echo -e "正在自动化安装JDK 1.7，请稍后..."
			
			echo -e "正在检查系统有没有自带open-jdk"
			rpm -qa |grep java
			rpm -qa |grep jdk
			rpm -qa |grep gcj
			
			echo -e "检索包含java的列表"
			yum list java*
			
			echo -e "安装1.7.0的所有文件"
			yum install java-1.7.0-openjdk* -y

			echo -e "检查是否安装成功"
			java -version
			
			echo -e "-----------------------------------------------"
			echo -e "JDK 1.7 安装完成"
		fi

		if [ ${jdkVersion} -eq 2 ]
                        then
                        echo -e "正在自动化安装JDK 1.8，请稍后..."

                        echo -e "正在检查系统有没有自带open-jdk"
                        rpm -qa |grep java
                        rpm -qa |grep jdk
                        rpm -qa |grep gcj

                        echo -e "检索包含java的列表"
                        yum list java*

                        echo -e "安装1.8.0的所有文件"
                        yum install java-1.8.0-openjdk* -y

                        echo -e "检查是否安装成功"
                        java -version

			echo -e "-----------------------------------------------"
			echo -e "JDK 1.8 安装完成"
		fi
        fi

	# 4. MySQL的安装
	if [ ${projectId} -eq 4 ]
		then
		echo -e "\t"
		echo -e "\t"
		echo -e "\t======================"
		echo -e "\t请选择MySQL的版本"
                echo -e "\t\t 1 5.6         2 5.7"
                echo -e "\t\t--------------------"
                read -p "请输入:" mySQLVersion

		if [ ${mySQLVersion} -eq 2 ]
                        then
			echo -e "正在自动化安装MySQL 5.7，请稍后..."
			
			echo -e "进入本机的源文件目录"
			cd /usr/local/src
			
			echo -e "下载官方yum源的rpm包"
			wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
			echo -e "安装rpm包"
			rpm -ivh mysql57-community-release-el7-11.noarch.rpm
			
			echo -e "使用yum来安装mysql-server"
			yum install -y mysql-server
			
			echo -e "MySQL启动"
			systemctl start mysqld
			
			echo -e "查看是否启动成功"
			ps aux|grep mysqld

			echo -e "----------------------------------------------"
			
			echo -e "MySQL 安装完成，请继续操作"
			echo -e "MySQL 的初始密码如下，请及时修改"
			cat /var/log/mysqld.log|grep 'A temporary password'
			
			read -p "是否修改root密码?Y/N:" isUpdateRootPwd
			if [ ${isUpdateRootPwd} = "Y" ]
                                then
				echo -e "\t\t\t请输入默认密码进入mysql数据库"
				echo -e "\t\t\t执行修改命令：alter user 'root'@'localhost' identified by passwd;。修改密码，其中passwd为新密码"
				echo -e "\t\t\t执行命令：flush privileges; 数据使修改命令生效"
				echo -e "\t\t\t执行命令：exit; 退出mysql数据库，完成后见"
                                mysql -u root -p
                        fi
                        if [ ${isUpdateRootPwd} = "y" ]
                                then
				echo -e "\t\t\t请输入默认密码进入mysql数据库"
                                echo -e "\t\t\t执行修改命令：alter user 'root'@'localhost' identified by passwd;。修改密码，其中passwd为新密码"
                                echo -e "\t\t\t执行命令：flush privileges; 数据使命令生效"
                                echo -e "\t\t\t执行命令：exit; 退出mysql数据库，完成后见"
                                mysql -u root -p
                        fi

			echo -e "正在设置UTF-8字符集"
			sed -i '/innodb_buffer_pool_size/a\default-character-set = utf8\ncharacter_set_server =  utf8' /etc/my.cnf
			service mysqld restart

			read -p "是否开机启动?Y/N:" mySQLRebootStart
			if [ ${projectId} = "Y" ]
				then
				systemctl enable mysqld
			fi
			if [ ${projectId} = "y" ]
                                then
                                systemctl enable mysqld
                        fi
		fi
        fi

	# 退出
	if [ ${projectId} -eq -1 ]
		then
		isFinish=1
	fi
done
