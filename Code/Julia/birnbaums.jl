function birnbaums(RBD_Id, time, test_interval)
    # Use ModelingToolkit.jl for symbolic computations

    using ModelingToolkit
    using Symbolics  # Import Symbolics to avoid namespace conflicts
    using LinearAlgebra  # Import LinearAlgebra for sorting (if needed)

    # Define symbolic variables locally to avoid global scope issues
    @variables t tau
    
    # Get RBD details (assuming RBD is a function that returns a named tuple/struct)
    hp_details = RBD(RBD_Id)
    x = hp_details.x
    v = hp_details.v
    hp = hp_details.hp
    number_rv = length(x)

    # Calculate sensitivity formulas
    sensivity_formula = Vector{Any}(undef, number_rv)  # Use Vector{Any} since the diff result can be symbolic
    for ii = 1:number_rv
        sensivity_formula[ii] = ModelingToolkit.Differential(x[ii])(hp) # Correct way to express the derivative
    end

    # Evaluate sensitivity formulas at nominal values 'v'
    dh_v = Vector{Any}(undef, number_rv) # Use Any for symbolic values
    for ii = 1:number_rv
        dh_v[ii] = substitute(sensivity_formula[ii], Dict(x .=> v)) # Substitute all x with v at once
    end

    # Evaluate at the specified time and test interval. Use substitute to be more flexible.
    for ii = 1:number_rv
        dh_v[ii] = substitute(dh_v[ii], Dict([t => time, tau => test_interval]))
        dh_v[ii] = simplify(dh_v[ii]) # Simplify the symbolic expression.
        dh_v[ii] = Num(dh_v[ii]) # Convert back to Num to use Num.value
    end
    
    # Convert symbolic numbers to Float64
    sensivity_value = Float64.(Num.(dh_v)) # Convert all elements to Float64
    
    # Sort the sensitivities in descending order
    i = sortperm(sensivity_value, rev=true) # returns the indices
    components_descending_order = i

    return components_descending_order, sensivity_formula, sensivity_value
end

