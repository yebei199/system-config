from src.utils.pull_push import PullPush

path1 = r'D:\A_sf_py\system-config\test\source\pull_push\local_t1'
path2 = r'D:\A_sf_py\system-config\test\source\pull_push\t2'


def test_pull_push():
    pull_push = PullPush(path1, path2)
    pull_push.pull_from_local()
    pass
