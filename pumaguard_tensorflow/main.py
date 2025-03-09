"""
Main module for the pumaguard_tensorflow package.
"""

import tensorflow

from pumaguard_tensorflow import __VERSION__


def main():
    """
    Entry point for the pumaguard_tensorflow application.
    """
    print(f'pumaguard-tensorflow version {__VERSION__}')
    print(f'TensorFlow version {tensorflow.__version__}')
