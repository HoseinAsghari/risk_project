function criticality(RBD_Id, sensivity_formula, sensivity_value, time, test_interval)
    # Assuming RBD function is defined and returns a named tuple or struct
    hp_details = RBD(RBD_Id)
    x = hp_details.x
    v = hp_details.v
    hp = hp_details.hp
    f = hp_details.f
    
    # Substitute x with v in hp to get hp_value
    hp_value = substitute(hp, x, v) #Using substitute function below 
    
    number_rv = length(x)
    
    criticality_formula = Vector{Any}(undef, number_rv)  # Using Vector{Any} for symbolic expressions
    temp = Vector{Float64}(undef, number_rv)  # Use Float64 to match vpa behaviour
    
    for ii in 1:number_rv
        criticality_formula[ii] = sensivity_formula[ii] * (1 - x[ii]) / (1 - hp)
        temp[ii] = sensivity_value[ii] * (1 - v[ii]) / (1 - hp_value)
        temp[ii] = substitute(temp[ii], [time, test_interval])  # Substitute t and tau
    end
    
    criticality_value = temp
    
    # Sort temp and get indices
    i = sortperm(temp, rev=true)  # Returns indices of sorted array
    components_descending_order = i
    
    hp_value = substitute(hp_value, [time, test_interval])  # Substitute t and tau
    f_value = substitute(substitute(f, x, v), [time, test_interval]) # Substitute t and tau

    return components_descending_order, criticality_formula, criticality_value, hp_value, f_value
end

# Helper function to perform substitution for both symbolic and numeric variables
function substitute(expr, vars, vals)
    #using Symbolics
    
    if typeof(expr) <: Number #Check if expr is already a number/float
        return expr
    end
    
    
    if typeof(expr) <: Array
        result = similar(expr)
        for i in eachindex(expr)
            result[i] = substitute(expr[i], vars, vals)
        end
        return result
    end

    # Handle symbolic expressions (using Symbolics.jl)
    # Symbolics.jl substitution syntax
    if (typeof(expr) <: Num)  # Check if expr is a symbolic number using Symbolics.jl
        
        substitutions = Dict(vars[i] => vals[i] for i in 1:length(vars)) #create a dictionary with rules of subsitution
       
        return Symbolics.substitute(expr, substitutions)
        
        
    else # Numeric case

      if(length(vars) != 2)
            println("Variables in substitute function are not the desired size: ", length(vars))
      end
       t = vars[1];
       tau = vars[2];

       time = vals[1];
       test_interval = vals[2];

       return eval(Meta.parse(replace(string(expr), "t"=>string(time), "tau"=>string(test_interval))))
    end
   

end