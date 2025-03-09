"""
Pumaguard tensorflow support
"""

import importlib.metadata

try:
    __VERSION__ = importlib.metadata.version('pumaguard-tensorflow')
except importlib.metadata.PackageNotFoundError:
    __VERSION__ = 'unknown'
