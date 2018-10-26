using GSL
using Compat.Test

let
    lmax = 5
    m = 2
    x = 0.5

    # these give subtly different answers on 32/64-bit.    
    @test sf_legendre_Plm_array(lmax, m, x)         ≈ [2.25, 5.625, 4.21875, -4.921875]
    @test sf_legendre_Plm_deriv_array(lmax, m, x)[1] ≈ [2.25,5.625,4.21875,-4.921875]
    @test sf_legendre_Plm_deriv_array(lmax, m, x)[2] ≈ [-3.0,3.75,33.75,55.78125]
    @test sf_legendre_sphPlm_array(lmax, m, x)      ≈ [0.2897056515173923, 0.38324455366248106, 
                                                        0.18816934037548766, -0.15888479843070935]
    @test sf_legendre_sphPlm_deriv_array(lmax, m, x)[1]  ≈ [0.2897056515173923,0.38324455366248106,
                                                            0.18816934037548766,-0.15888479843070935]
    @test sf_legendre_sphPlm_deriv_array(lmax, m, x)[2]  ≈ [-0.38627420202318974,0.2554963691083207,
                                                            1.5053547230039015,1.8006943822147061]

end