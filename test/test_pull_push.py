from src.utils.pull_push import PullPush

path1 = r'D:\A_sf_py\system-config\test\source\pull_push\local_t1'
path2 = r'D:\A_sf_py\system-config\test\source\pull_push\t2'


def test_pull_push():
    pull_push = PullPush(path1, path2)
    pull_push.copy_from_local()
    pull_push.copy_from_remote()
    pass


def test_list():
    a1 = [1, 2, 3]
    a2 = a1[1:]
    assert a2 == [2, 3]
