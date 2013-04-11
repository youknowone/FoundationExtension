
import pytest
from dependency import *

@pytest.mark.parametrize(('input', 'output', 'regex'), [
    (['#import "NSData.h"'], ["NSData"], '"(.*).h"'),
    (['    # import      "NSData.h"   ', ' #  import  "NSObject.h"'], ["NSData", "NSObject"], '"(.*).h"'),
    (['  '], [], '"(.*).h"'),
    (['#import <FoundationExtension/NSADictionary.h>'], ['NSADictionary'], '<.*/(.*).h>'),
])
def test_find_import(input, output, regex):
    assert output == find_import(input, regex)

def test_find_deps():
    name, deps, edeps = find_deps('../FoundationExtension/NSData.m')
    assert 'NSData' == name
    assert 'NSData' not in deps
    assert not edeps
    name, deps, edeps = find_deps('../UIKitExtension/NSAttributedString+UIKit.m')
    assert edeps
