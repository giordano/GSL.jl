#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#############################
# 22.7 Histogram Operations #
#############################
export gsl_histogram_equal_bins_p, gsl_histogram_add, gsl_histogram_sub,
       gsl_histogram_mul, gsl_histogram_div, gsl_histogram_scale,
       gsl_histogram_shift


# This function returns 1 if the all of the individual bin ranges of the two
# histograms are identical, and 0 otherwise.
# 
#   Returns: Cint
function gsl_histogram_equal_bins_p(h1::Ptr{gsl_histogram}, h2::Ptr{gsl_histogram})
    gsl_errno = ccall( (:gsl_histogram_equal_bins_p, :libgsl), Cint,
        (Ptr{gsl_histogram}, Ptr{gsl_histogram}), h1, h2 )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# This function adds the contents of the bins in histogram h2 to the
# corresponding bins of histogram h1,  i.e. h'_1(i) = h_1(i) + h_2(i).  The two
# histograms must have identical bin ranges.
# 
#   Returns: Cint
function gsl_histogram_add(h2::Ptr{gsl_histogram})
    h1 = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_add, :libgsl), Cint,
        (Ptr{gsl_histogram}, Ptr{gsl_histogram}), h1, h2 )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h1)
end


# This function subtracts the contents of the bins in histogram h2 from the
# corresponding bins of histogram h1, i.e. h'_1(i) = h_1(i) - h_2(i).  The two
# histograms must have identical bin ranges.
# 
#   Returns: Cint
function gsl_histogram_sub(h2::Ptr{gsl_histogram})
    h1 = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_sub, :libgsl), Cint,
        (Ptr{gsl_histogram}, Ptr{gsl_histogram}), h1, h2 )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h1)
end


# This function multiplies the contents of the bins of histogram h1 by the
# contents of the corresponding bins in histogram h2, i.e. h'_1(i) = h_1(i) *
# h_2(i).  The two histograms must have identical bin ranges.
# 
#   Returns: Cint
function gsl_histogram_mul(h2::Ptr{gsl_histogram})
    h1 = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_mul, :libgsl), Cint,
        (Ptr{gsl_histogram}, Ptr{gsl_histogram}), h1, h2 )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h1)
end


# This function divides the contents of the bins of histogram h1 by the
# contents of the corresponding bins in histogram h2, i.e. h'_1(i) = h_1(i) /
# h_2(i).  The two histograms must have identical bin ranges.
# 
#   Returns: Cint
function gsl_histogram_div(h2::Ptr{gsl_histogram})
    h1 = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_div, :libgsl), Cint,
        (Ptr{gsl_histogram}, Ptr{gsl_histogram}), h1, h2 )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h1)
end


# This function multiplies the contents of the bins of histogram h by the
# constant scale, i.e.  h'_1(i) = h_1(i) * scale.
# 
#   Returns: Cint
function gsl_histogram_scale(scale::Cdouble)
    h = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_scale, :libgsl), Cint,
        (Ptr{gsl_histogram}, Cdouble), h, scale )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h)
end


# This function shifts the contents of the bins of histogram h by the constant
# offset, i.e.  h'_1(i) = h_1(i) + offset.
# 
#   Returns: Cint
function gsl_histogram_shift(offset::Cdouble)
    h = convert(Ptr{gsl_histogram}, Array(gsl_histogram, 1))
    gsl_errno = ccall( (:gsl_histogram_shift, :libgsl), Cint,
        (Ptr{gsl_histogram}, Cdouble), h, offset )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(h)
end