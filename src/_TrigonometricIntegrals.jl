#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
##################################
# 7.17.5 Trigonometric Integrals #
##################################
export gsl_sf_Si, gsl_sf_Si_e, gsl_sf_Ci, gsl_sf_Ci_e


# These routines compute the Sine integral  Si(x) = \int_0^x dt \sin(t)/t.
# 
#   {$\hbox{Si}(x) = \int_0^x dt \sin(t)/t$} 
#   Exceptional Return Values: none 
#   Returns: Cdouble
function gsl_sf_Si (x::Cdouble)
    ccall( (:gsl_sf_Si, "libgsl"), Cdouble, (Cdouble, ), x )
end


# These routines compute the Sine integral  Si(x) = \int_0^x dt \sin(t)/t.
# 
#   Returns: Cint
function gsl_sf_Si_e (x::Cdouble, result::Ptr{gsl_sf_result})
    ccall( (:gsl_sf_Si_e, "libgsl"), Cint, (Cdouble, Ptr{gsl_sf_result}),
        x, result )
end


# These routines compute the Cosine integral  Ci(x) = -\int_x^\infty dt
# \cos(t)/t for x > 0.
# 
#   {$\hbox{Ci}(x) = -\int_x^\infty dt \cos(t)/t$} 
#   Domain: x > 0.0 
#   Exceptional Return Values: GSL_EDOM 
#   Returns: Cdouble
function gsl_sf_Ci (x::Cdouble)
    ccall( (:gsl_sf_Ci, "libgsl"), Cdouble, (Cdouble, ), x )
end


# These routines compute the Cosine integral  Ci(x) = -\int_x^\infty dt
# \cos(t)/t for x > 0.
# 
#   Returns: Cint
function gsl_sf_Ci_e (x::Cdouble, result::Ptr{gsl_sf_result})
    ccall( (:gsl_sf_Ci_e, "libgsl"), Cint, (Cdouble, Ptr{gsl_sf_result}),
        x, result )
end