#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

import webplatformcompat

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

version = webplatformcompat.__version__

if sys.argv[-1] == 'publish':
    os.system('python setup.py sdist upload')
    print("You probably want to also tag the version now:")
    print("  git tag -a %s -m 'version %s'" % (version, version))
    print("  git push --tags")
    sys.exit()

readme = open('README.rst').read()


setup(
    name='web-platform-compat',
    version=version,
    description="""Web Platform Compatibility API""",
    long_description=readme,
    author='John Whitlock',
    author_email='john@factorialfive.com',
    url='https://github.com/jwhitlock/web-platform-compat',
    packages=[
        'webplatformcompat',
    ],
    include_package_data=True,
    install_requires=[
    ],
    test_suite='wpcsite.runtests.runtests',
    license="BSD",
    zip_safe=False,
    keywords='web-platform-compat',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: Mozilla Public License 2.0 (MPL 2.0)',
        'Natural Language :: English',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
    ],
)