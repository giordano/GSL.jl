#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
########################################
# 23.3 Opening an existing ntuple file #
########################################
export gsl_ntuple_open


# This function opens an existing ntuple file filename for reading and returns
# a pointer to a corresponding ntuple struct. The ntuples in the file must have
# size size.  A pointer to memory for the current ntuple row ntuple_data must
# be supplied—this is used to copy ntuples in and out of the file.
# 
#   Returns: Ptr{gsl_ntuple}
function gsl_ntuple_open (filename::Ptr{Cchar}, ntuple_data::Ptr{Void}, size::Csize_t)
    ccall( (:gsl_ntuple_open, "libgsl"), Ptr{gsl_ntuple}, (Ptr{Cchar},
        Ptr{Void}, Csize_t), filename, ntuple_data, size )
end