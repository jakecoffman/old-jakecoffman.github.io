#!/usr/bin/env bash

hugo
cd public
git add .
git commit -mupdate
git push
