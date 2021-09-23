#!/bin/bash -eux

PDFium_URL='https://pdfium.googlesource.com/pdfium.git'
OS=${PDFium_OS:?}

# Clone
gclient config --unmanaged "$PDFium_URL"
gclient sync

# Swicth branch
if [ -n "${PDFium_BRANCH:-}" ]; then
  pushd pdfium
  git checkout "${PDFium_BRANCH}"
  gclient sync
  popd
fi