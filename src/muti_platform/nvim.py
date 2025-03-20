# create_time: 2024/12/20 15:36
""" """

import os

from src.utils.original_path import OriginalPath


class Nvim:
    def __init__(self):
        win_path = r''
        self.remote_path = os.path.join(
            OriginalPath().root_path, 'source', 'config', 'nvim'
        )


# 示例调用
# pull_from_local('/path/to/local/folder', '/path/to/remote/folder')
def main():
    nvim = Nvim()
    print(nvim.remote_path)
    pass


if __name__ == '__main__':
    main()
