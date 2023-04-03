#! /usr/bin/bash


ls | sed -n 's/\(.*\)\.s$/mkdir \1; mv \1.s \1/p' | sh -x
