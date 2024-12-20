# creat_time: 2024/12/20 15:36
""" """

import os

from src.utils.original_path import OriginalPath


class Nvim:
    def __init__(self):
        self.path = os.path.join(
            OriginalPath().root_path, 'source', 'config', 'nvim'
        )


def main():
    nvim = Nvim()
    os.link(nvim.path, r'D:\A_sf_py\system-config\test')
    pass


if __name__ == '__main__':
    main()
