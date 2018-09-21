module Polynomial

export Poly
struct Poly{T}
    coeffs::Vector{T}
end

export evaluate
function evaluate(p::Poly, x)
    sum(c * x ^ (i-1) for (i,c) in enumerate(p.coeffs))
end

function Base. +(p::Poly, q::Poly)
    l = max(length(p.coeffs), length(q.coeffs))
    rcoeffs = zeros(l)
    for (i,c) in enumerate(p.coeffs)
        rcoeffs[i] += c
    end
    for (i,c) in enumerate(q.coeffs)
        rcoeffs[i] += c
    end
    Poly(rcoeffs)
end

function Base. *(a, p::Poly)
    Poly(map(x->a*x, p.coeffs))
end

function Base. -(p::Poly)
    (-1) * p
end

function Base. -(p::Poly, q::Poly)
    p + (-q)
end

function Base. ==(p::Poly, q::Poly)
    d = p - q
    all(d.coeffs .== 0)
end


export deriv
function deriv(p::Poly)
    Poly([(i-1) *c for (i,c) in enumerate(p.coeffs)][2:end])
end

end # module

