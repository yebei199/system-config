import os

from src.muti_platform.nvim import Nvim


def test_nvim():
    nvim = Nvim()
    os.link(nvim.path, r'D:\A_sf_py\system-config\test')
    pass
