## 远程部署metricbeat


#### 本机安装Ansible（Mac）

```
brew install ansible
```

#### 配置用户

```
sudo vi /etc/ansible/hosts
```

参考
```
[metricbeat]
test.domain.com
[metricbeat:vars]
ansible_ssh_user="root"
ansible_ssh_port=22
```
根据实际情况配置远程服务器信息

#### 安装docker环境

运行

```
ansible-playbook install.yml --extra-vars "host=metricbeat"
```

host参数为/etc/ansible/hosts中对应配置host名称


#### 部署metricbeat

注意：

metricbeat-nginx只有在nginx支持stub_status才生效

通过以下命令查看nginx支持情况，如果返回信息中存在stub_status module证明支持

```
nginx -V
```



修改项目目录下 metricbeat/.env为正确配置

```
ELK_VERSION=7.9.1  elastic版本号
ELASTIC_USER=elastic   elastic用户
ELASTIC_PASSWORD=password  elastic密码
DEFAULT_NETWORK=my-services  docker容器内网络
ELASTIC_SERVER_HOST=localhost  远程elastic地址
KIBANA_HOST=localhost  远程kibana地址
```

部署

```
ansible-playbook deploy.yml --extra-vars "host=metricbeat"
```
