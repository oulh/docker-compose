FROM ubuntu:latest

# 安装必要的软件包
RUN apt-get update && apt-get install -y \
    curl \
    wget

# 安装code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# 设置code-server启动脚本
RUN echo "#!/bin/bash \n\
code-server --bind-addr 0.0.0.0:8080 --auth none" > /root/startup.sh
RUN chmod +x /root/startup.sh

# 设置容器启动时运行的命令
CMD ["/root/startup.sh"]
