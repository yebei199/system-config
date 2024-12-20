import os


def singleton(cls):
    instances = {}

    def getinstance(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]

    return getinstance


@singleton
class OriginalPath:
    def __init__(self):
        self.root_path = self.project_root_path()
        """ The root path of the project """
        print('\nOriginalPath initialized')

    @staticmethod
    def project_root_path():
        return os.path.abspath(
            os.path.join(os.path.dirname(__file__), os.pardir, os.pardir)
        )
