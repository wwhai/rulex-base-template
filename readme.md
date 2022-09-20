# RULEX 基础模板项目
该模板项目用来快速构建RULEX网关，相当于一个代码模板，快速生成一个基础仓库。
## 文件列表
```sh
.
├── .gitignore
├── Makefile
├── go.mod
├── go.sum
├── install.sh
├── main.go
├── readme.md
└── rulex.ini

```
## 构建
```sh
make arm64
make linux
make arm32
```
## 安装
```sh
makr ${target}
sudo bash ./install.sh
```