
import pytest
from dependency import *

@pytest.mark.parametrize(('input', 'output'), [
    (['#import "NSData.h"'], ["NSData"]),
    (['    # import      "NSData.h"   ', ' #  import  "NSObject.h"'], ["NSData", "NSObject"]),
    (['  '], []),
])
def test_find_import(input, output):
    assert output == find_import(input)

def test_find_deps():
    name, deps = find_deps('../FoundationExtension/NSData.m')
    assert 'NSData' == name
    assert 'NSData' not in deps
