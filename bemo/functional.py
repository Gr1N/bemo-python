# -*- coding: utf-8 -*-

from collections import OrderedDict

__all__ = (
    'partial_match',
    'deep_sort',
)


def partial_match(original, expected):
    original = deep_sort(original.copy())
    expected = deep_sort(expected.copy())

    for k, v in expected.items():
        if k in original:
            assert v == original[k]

    return True


def deep_sort(d):
    result = OrderedDict()

    for k, v in sorted(d.items()):
        if isinstance(v, dict):
            result[k] = deep_sort(v)
        else:
            result[k] = v

    return result
