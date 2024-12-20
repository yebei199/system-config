import os


def create_link(src: str, dst: str):
    # 创建硬链接
    try:
        os.link(src, dst)
        print(f'硬链接创建成功: {dst} -> {src}')
    except OSError as e:
        print(f'创建硬链接失败: {e}')
