# create_time: 2024/12/20 15:36
""" """

import os
from functools import cached_property

from src.config.config import Config
from src.utils.original_path import OriginalPath
from src.utils.pull_push import PullPush


class Nvim:
    def __init__(self):
        self.win_path = os.path.join(Config.win_config_path, 'nvim')
        self.remote_path = os.path.join(
            OriginalPath().root_path, 'source', 'config', 'nvim'
        )

    @cached_property
    def pull_push(self):
        return PullPush(
            local_folder_path=self.win_path, remote_folder_path=self.remote_path
        )


# 示例调用
# pull_from_local('/path/to/local/folder', '/path/to/remote/folder')
def main():
    nvim = Nvim()
    nvim.pull_push.pull_from_local()
    print(nvim.remote_path)
    pass


if __name__ == '__main__':
    main()
