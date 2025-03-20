from src.utils.pull_push import PullPush

path1 = r'C:\Users\Administrator\github-projects\system-config\test\source\pull_push\t1'
path2 = r'C:\Users\Administrator\github-projects\system-config\test\source\pull_push\t2'


def test_pull_push():
    pull_push = PullPush(path1, path2)
    pull_push.pull_from_local()
    pass
