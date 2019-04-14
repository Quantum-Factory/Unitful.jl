# Unitful.jl

## Upstream Introduction

Unitful is a Julia package for physical units. We want to support not only
SI units but also any other unit system. We also want to minimize or in some
cases eliminate the run-time penalty of units. There should be facilities
for dimensional analysis. All of this should integrate easily with the usual
mathematical operations and collections that are found in Julia base.

## Upstream Repo

This is a fork of https://github.com/ajkeller34/Unitful.jl with the
purpose to incorporate methods from `Base` that create or act on
complex numbers: Unitful quantities can be Complex, e.g. generalized
frequencies or matrix elements in the ray transfer matrix approach for
paraxial Gaussian beams.
