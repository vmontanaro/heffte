message(STATUS "")

message(STATUS "heFFTe ${PROJECT_VERSION}")

string(TOUPPER "${CMAKE_BUILD_TYPE}" HEFFTE_BUILD_TYPE)
set(HEFFTE_OPTIONS "CMAKE_INSTALL_PREFIX;BUILD_SHARED_LIBS;CMAKE_BUILD_TYPE;CMAKE_CXX_FLAGS_${HEFFTE_BUILD_TYPE};CMAKE_CXX_FLAGS;MPI_CXX_COMPILER;MPI_CXX_COMPILE_OPTIONS")

if (Heffte_ENABLE_CUDA)
    list(APPEND HEFFTE_OPTIONS "CUDA_NVCC_FLAGS")
    list(APPEND HEFFTE_OPTIONS "CUDA_TOOLKIT_ROOT_DIR")
endif()

foreach(_opt FFTW MKL CUDA ROCM ONEAPI PYTHON FORTRAN TRACING)
    list(APPEND HEFFTE_OPTIONS "Heffte_ENABLE_${_opt}")
endforeach()

foreach(_opt ${HEFFTE_OPTIONS})
    message(STATUS " -D ${_opt}=${${_opt}}")
endforeach()
unset(_opt)

message(STATUS "")
