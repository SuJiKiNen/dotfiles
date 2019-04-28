import pexpect
import pytest


@pytest.mark.parametrize("src", [
    "aliyun",
    "douban",
    "edu",
])
def test_pipsrc(src):
    child = pexpect.spawn("bash")
    child.sendline(f"pipsrc {src}")
    child.expect(f".*{src}*.*")
    child.sendline("pip install pip")
    child.expect(f".*indexes.*{src}*.*")
