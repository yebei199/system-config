import os
import shutil


class PullPush:
    def __init__(self, local_folder_path: str, remote_folder_path: str):
        self.local_folder_path = local_folder_path
        self.remote_folder_path = remote_folder_path

    def pull_from_local(self):
        """
        从本地拉取整个配置文件夹到远程位置。

        Args:
            local_folder_path (str): 源文件夹路径
            remote_folder_path (str): 目标文件夹路径
        """
        local_folder_path = self.local_folder_path
        remote_folder_path = self.remote_folder_path
        if not os.path.exists(local_folder_path):
            raise FileNotFoundError(f'本地文件夹 {local_folder_path} 未找到')

        # 如果远程文件夹不存在，则创建；如果存在，则先清空其内容
        if not os.path.exists(remote_folder_path):
            os.makedirs(remote_folder_path)
        else:
            # 清空远程文件夹内容
            for filename in os.listdir(remote_folder_path):
                file_path = os.path.join(remote_folder_path, filename)
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)  # 删除文件或符号链接
                elif os.path.isdir(file_path):
                    shutil.rmtree(file_path)  # 删除子目录及其内容

        # 复制本地文件夹到远程位置
        for root, _, files in os.walk(local_folder_path):
            # 计算相对路径并构建目标目录路径
            relative_path = os.path.relpath(root, local_folder_path)
            target_dir = os.path.join(remote_folder_path, relative_path)

            # 创建目标目录（若不存在）
            if not os.path.exists(target_dir):
                os.makedirs(target_dir)

            # 复制文件到目标目录
            for file in files:
                src_file = os.path.join(root, file)
                dst_file = os.path.join(target_dir, file)
                shutil.copy2(src_file, dst_file)  # 覆盖已有文件，保留元数据
