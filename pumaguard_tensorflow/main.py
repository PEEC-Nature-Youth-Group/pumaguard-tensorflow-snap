"""
Main module for the pumaguard_tensorflow package.
"""

import tensorflow as tf

from pumaguard_tensorflow import __VERSION__


def main():
    """
    Entry point for the pumaguard_tensorflow application.
    """
    print(f'pumaguard-tensorflow version {__VERSION__}')
    print(f'TensorFlow version {tf.__version__}')
    print('Trying to connect to a TPU')
    try:
        tpu = tf.distribute.cluster_resolver.TPUClusterResolver()
        tf.config.experimental_connect_to_cluster(tpu)
        tf.tpu.experimental.initialize_tpu_system(tpu)
        print('Running on a TPU with %d cores',
              tpu.num_accelerators()["TPU"])
    except ValueError:
        print("WARNING: Not connected to a TPU runtime; Will try GPU")
        if tf.config.list_physical_devices('GPU'):
            print('Running on %d GPUs', len(
                tf.config.list_physical_devices("GPU")))
        print('WARNING: Not connected to TPU or GPU runtime; '
              'Will use CPU context')
    print('Done!')
