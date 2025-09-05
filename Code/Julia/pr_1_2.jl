function group_components_with_equal_values(components_order, sensivity_value)
    temp = sensivity_value[components_order]
    i = 1
    j = i
    k = 1
    n = length(components_order)
    r = Vector{Any}(undef, n) # Use Vector{Any} instead of cell

    if temp[1] == temp[2]
        while true
            x = temp[i]
            if j < 16
                if (j > 1 && x != temp[j+1] && x == temp[j-1])
                    r[k] = components_order[i:j]'
                    j = j + 1
                    i = j
                    k = k + 1
                elseif (j > 1 && x != temp[j+1] && x != temp[j-1])
                    r[k] = components_order[i:j]'
                    j = j + 1
                    i = j
                    k = k + 1
                else
                    j = j + 1
                end
            elseif j == 16
                r[k] = components_order[i:j]'
                break
            end
        end
    else
        r[1] = [components_order[1]]
        j = 2
        i = j
        k = 2
        while true
            x = temp[i]
            if j < 16
                if (j > 1 && x != temp[j+1] && x == temp[j-1])
                    r[k] = components_order[i:j]'
                    j = j + 1
                    i = j
                    k = k + 1
                elseif (j > 1 && x != temp[j+1] && x != temp[j-1])
                    r[k] = components_order[i:j]'
                    j = j + 1
                    i = j
                    k = k + 1
                else
                    j = j + 1
                end
            elseif j == 16
                r[k] = components_order[i:j]'
                break
            end
        end
    end

    return r[1:k-1] # Return only the filled elements
end


# Dummy implementations of birnbaums and criticality for demonstration
function birnbaums(arg1, arg2, arg3)
    components_descending_order_sensivity = collect(1:16)  # Example values
    sensivity_formula = "Some formula" # Example formula
    sensivity_value = rand(16) # Example sensitivity values
    return components_descending_order_sensivity, sensivity_formula, sensivity_value
end

function criticality(arg1, sensivity_formula, sensivity_value, arg2, arg3)
    components_descending_order_criticality = collect(1:16) # Example values
    criticality_formula = "Another formula" # Example formula
    criticality_value = rand(16) # Example criticality values
    hp = rand(16) # Example hp values
    f = rand(16)  # Example f values
    return components_descending_order_criticality, criticality_formula, criticality_value, hp, f
end


# Main script
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(3, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp, f = criticality(3, sensivity_formula, sensivity_value, 50000, 5000)


equal_value_components_descending_order_sensivity = group_components_with_equal_values(components_descending_order_sensivity, sensivity_value)
equal_value_components_descending_order_criticality = group_components_with_equal_values(components_descending_order_criticality, criticality_value)

println("Equal Sensivity: ", equal_value_components_descending_order_sensivity)
println("Equal Criticality: ", equal_value_components_descending_order_criticality)