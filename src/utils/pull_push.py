import os
import shutil
from datetime import datetime


class PullPush:
    BACK_UP_FOLDER_NAME = 'yb_backup'
    BACKUP_COUNT = 2

    def __init__(self, local_folder_path: str, remote_folder_path: str):
        self.local_folder_path = local_folder_path
        self.remote_folder_path = remote_folder_path

    def copy_from_local(self):
        """从本地拉取整个配置文件夹到远程位置, 会覆盖远程位置的内容,
        有git不用备份,直接强制覆盖
        """
        local_folder_path = self.local_folder_path
        remote_folder_path = self.remote_folder_path

        if not os.path.exists(local_folder_path):
            raise FileNotFoundError(f'本地文件夹 {local_folder_path} 未找到')

        self._copy_folder(local_folder_path, remote_folder_path)

    def copy_from_remote(self):
        """
        从远程拉取整个配置文件夹到本地位置, 会覆盖本地位置的内容,
        """
        local_folder_path = self.local_folder_path
        remote_folder_path = self.remote_folder_path

        if not os.path.exists(remote_folder_path):
            raise FileNotFoundError(f'远程文件夹 {remote_folder_path} 未找到')

        self._copy_folder(remote_folder_path, local_folder_path)

    def _backup_folder(self, folder_path: str):
        """备份目标文件夹到 backup 子文件夹，并确保只保留最新的一个备份"""
        backup_dir = os.path.join(folder_path, self.BACK_UP_FOLDER_NAME)
        # 如果 backup 文件夹不存在，则创建
        if not os.path.exists(backup_dir):
            os.makedirs(backup_dir)

        # 创建新的备份文件夹（以当前时间戳命名）
        new_backup_name = f'{self.BACK_UP_FOLDER_NAME}_{datetime.now().strftime("%Y%m%d%H%M%S")}'
        new_backup_path = os.path.join(backup_dir, new_backup_name)
        os.makedirs(new_backup_path)  # 创建备份子文件夹

        # 将源文件夹内的所有内容移动到备份子文件夹中
        for item in os.listdir(folder_path):
            item_path = os.path.join(folder_path, item)
            if item != self.BACK_UP_FOLDER_NAME:  # 跳过 backup 文件夹本身
                shutil.move(item_path, new_backup_path)

        # 查找已有的备份文件夹
        existing_backups: list[str] = [
            name
            for name in os.listdir(backup_dir)
            if os.path.isdir(os.path.join(backup_dir, name))
        ]
        existing_backups.sort(
            reverse=True
        )  # 按名称倒序排列（假设名称包含时间戳）

        # 如果存在超过一个备份，则删除到只剩2个备份
        if len(existing_backups) > self.BACKUP_COUNT:
            for i in existing_backups[self.BACKUP_COUNT :]:
                shutil.rmtree(os.path.join(backup_dir, i))

    def _copy_folder(self, src_folder_path: str, dst_folder_path: str):
        # 如果目标文件夹不存在，则创建；如果存在，则先备份其内容
        if os.path.exists(dst_folder_path):
            self._backup_folder(dst_folder_path)
        else:
            os.makedirs(dst_folder_path)

        # 使用 shutil.copytree 复制整个目录树，忽略备份文件夹
        shutil.copytree(
            src_folder_path,
            dst_folder_path,
            dirs_exist_ok=True,  # 允许目标目录已存在
            ignore=shutil.ignore_patterns(
                self.BACK_UP_FOLDER_NAME
            ),  # 忽略备份文件夹
        )
