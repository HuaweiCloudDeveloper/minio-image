#!/bin/bash

# MinIO 单节点单驱动器(SNSD)安装脚本
# 适用于64位ARM Linux系统(RHEL/Debian/Ubuntu)
# 需要root权限执行

# 步骤1: 创建MinIO用户和组
echo "正在创建MinIO用户和组..."
groupadd -r minio-user
useradd -M -r -g minio-user minio-user

# 步骤2: 创建数据存储目录并设置权限
DATA_DIR="/mnt/data"
echo "正在创建数据目录 ${DATA_DIR}..."
mkdir -p ${DATA_DIR}
chown minio-user:minio-user ${DATA_DIR}

# 步骤3: 下载并安装MinIO服务器(RPM包方式)
echo "正在下载并安装MinIO RPM包..."
wget https://dl.min.io/server/minio/release/linux-arm64/archive/minio-20250422221226.0.0-1.aarch64.rpm -O minio.rpm
dnf install -y minio.rpm

# 步骤4: 创建环境变量配置文件
echo "正在配置MinIO环境变量..."
cat > /etc/default/minio <<EOF
# MinIO根用户凭据(建议修改)
MINIO_ROOT_USER=myminioadmin
MINIO_ROOT_PASSWORD=minio-secret-key-change-me

# MinIO存储卷路径
MINIO_VOLUMES="${DATA_DIR}"

# 其他选项(如控制台端口)
MINIO_OPTS="--console-address :9001"
EOF

# 步骤5: 设置systemd服务(已由RPM包安装)
# 检查服务文件是否存在
if [ ! -f /usr/lib/systemd/system/minio.service ]; then
    echo "错误: MinIO服务文件未找到!"
    exit 1
fi

# 步骤6: 启动MinIO服务
echo "正在启动MinIO服务..."
systemctl start minio.service

# 设置开机自启
systemctl enable minio.service

# 步骤7: 验证服务状态
echo "检查MinIO服务状态..."
systemctl status minio.service

# 显示初始连接信息
echo ""
echo "MinIO安装完成!"
echo "控制台访问地址: http://<服务器IP>:9001"
echo "默认凭据: myminioadmin / minio-secret-key-change-me"
echo ""
echo "建议:"
echo "1. 立即更改默认凭据"
echo "2. 配置防火墙允许9000(API)和9001(控制台)端口"
echo "3. 生产环境请考虑使用分布式部署方案"