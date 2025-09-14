# creat_time: 2025/3/27 11:36
""" """

import os
from enum import Enum
from functools import cached_property


class System(Enum):
    WINDOWS = 'Windows'
    LINUX = 'Linux'
    MACOS = 'macOS'


class LocalSystem:
    @cached_property
    def system(self) -> System:
        match os.name:
            case 'nt':
                return System.WINDOWS
            case 'posix':
                return System.LINUX
            case 'darwin':
                return System.MACOS
            case _:
                raise ValueError('Unknown operating system')
