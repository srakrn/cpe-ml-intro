# -*- coding: utf-8 -*-

import sys

python_version = list(sys.version_info)
if python_version[0] != 3 or (python_version[0] == 3 and python_version[1] < 5):
    print("Your Python version does not meet requirements. (Python >3.5)")
    exit(1)
else:
    print("Your Python version satisfies the requirements.")

try:
    import numpy
    print("Importing numpy successful")
except:
    print("Importing numpy failed!")
try:
    import scipy
    print("Importing scipy successful")
except:
    print("Importing scipy failed!")
try:
    import pandas
    print("Importing pandas successful")
except:
    print("Importing pandas failed!")
try:
    import matplotlib.pyplot as plt
    print("Importing matplotlib successful")
except:
    print("Importing matplotlib failed!")
try:
    from sklearn.neural_network import MLPClassifier
    print("Importing scikit-learn successful")
except:
    print("Importing scikit-learn failed!")
try:
    import mlxtend
    print("Importing mlxtend successful")
except:
    print("Importing mlxtend failed!")
try:
    import mnist
    print("Importing mnist successful")
    mnist.test_labels()
    print("Loading of dataset completed")
except ImportError:
    print("Importing mnist failed!")
except AttributeError:
    print("Can't call mnist loading function, prehaps you've installed the wrong mnist?")
try:
    import jupyter
    print("Importing jupyter successful")
except:
    print("Importing jupyter failed!")
