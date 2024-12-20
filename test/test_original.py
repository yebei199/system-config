from src.utils.original_path import OriginalPath


def test_original_path():
    OriginalPath()
    OriginalPath()
    original_path = OriginalPath()
    assert original_path.root_path
