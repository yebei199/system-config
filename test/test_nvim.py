import os

from src.muti_platform.nvim import Nvim


def test_nvim():
    nvim = Nvim()
    os.link(nvim.remote_path, r'D:\A_sf_py\system-config\test')
    pass
