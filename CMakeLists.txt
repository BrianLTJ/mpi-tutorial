cmake_minimum_required (VERSION 2.8.11)

project(mpi-tutorial)

set(CMAKE_C_COMPILER "mpicc")
set(CMALE_CXX_COMPILER "mpicxx")

add_executable(mpi_all_gather.o mpi_all_gather.c)



