
# RBD_1
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(1, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp1, f1 = criticality(1, sensivity_formula, sensivity_value, 50000, 5000)
prob_success1 = (1 - f1) * 0.0  # Use 0.0 for floating-point type consistency
prob_fail1 = f1 * 130e6

# RBD_5
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(5, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp5, f5 = criticality(5, sensivity_formula, sensivity_value, 50000, 5000)
prob_success5 = (1 - f5) .* [37500, 187500]  # Use .* for element-wise multiplication with arrays
prob_fail5 = f5 .* [130037500, 130187500]

# RBD_6
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(6, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp6, f6 = criticality(6, sensivity_formula, sensivity_value, 50000, 5000)
prob_success6 = (1 - f6) .* [1350, 5200]
prob_fail6 = f6 .* [130001350, 130005200]

# RBD_7
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(7, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp7, f7 = criticality(7, sensivity_formula, sensivity_value, 50000, 5000)
prob_success7 = (1 - f7) .* [38850, 192700]
prob_fail7 = f7 .* [130038850, 130192700]

# RBD_8
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(8, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp8, f8 = criticality(8, sensivity_formula, sensivity_value, 50000, 5000)
prob_success8 = (1 - f8) .* [1900, 8600]
prob_fail8 = f8 .* [130001900, 130008600]

# RBD_9
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(9, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp9, f9 = criticality(9, sensivity_formula, sensivity_value, 50000, 5000)
prob_success9 = (1 - f9) .* [39400, 196100]
prob_fail9 = f9 .* [130039400, 130196100]

# RBD_10
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(10, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp10, f10 = criticality(10, sensivity_formula, sensivity_value, 50000, 5000)
prob_success10 = (1 - f10) .* [3250, 13800]
prob_fail10 = f10 .* [130003250, 130013800]

# RBD_11
components_descending_order_sensivity, sensivity_formula, sensivity_value = birnbaums(11, 50000, 5000)
components_descending_order_criticality, criticality_formula, criticality_value, hp11, f11 = criticality(11, sensivity_formula, sensivity_value, 50000, 5000)
prob_success11 = (1 - f11) .* [40750, 201300]
prob_fail11 = f11 .* [130040750, 130201300]
# calculation of left 8 sample branch and right 8 sample branch and compare
left_8_sample_branch = (prob_fail11 + prob_success11) + (prob_fail10 + prob_success10) + (prob_fail9 + prob_success9) + (prob_fail8 + prob_success8)
right_8_sample_branch = fill((prob_fail1 + prob_success1), 2) + (prob_fail5 + prob_success5) + (prob_fail6 + prob_success6) + (prob_fail7 + prob_success7)

if sum(left_8_sample_branch) < sum(right_8_sample_branch)
    println("left 8 branches are safer")
else
    println("right 8 branches are safer")
end

# calculation of left 4 sample branch of right 8 branches and right 4 sample branch and compare
left_4_sample_branch = (prob_fail6 + prob_success6) + (prob_fail7 + prob_success7)
right_4_sample_branch = fill((prob_fail1 + prob_success1), 2) + (prob_fail5 + prob_success5)

if sum(left_4_sample_branch) < sum(right_4_sample_branch)
    println("left 4 branches are safer")
else
    println("right 4 branches are safer")
end

# calculation of left 2 sample branch of left 8 branches and right 2 sample branch and compare
left_2_sample_branch = (prob_fail7 + prob_success7)
right_2_sample_branch = (prob_fail6 + prob_success6)

if sum(left_2_sample_branch) < sum(right_2_sample_branch)
    println("left 2 branches are safer")
else
    println("right 2 branches are safer")
end

function calculate_utility(components_descending_order_sensivity, f1, prob_fail1, prob_success1, prob_fail5, prob_success5, prob_fail6, prob_success6, prob_fail7, prob_success7, prob_fail8, prob_success8, prob_fail9, prob_success9, prob_fail10, prob_success10, prob_fail11, prob_success11, f5, f6, f7, f8, f9, f10, f11)

    n = length(components_descending_order_sensivity)
    utility = zeros(n ÷ 2, 1) # Use ÷ for integer division in Julia

    utility[1, 1] = (f1 - f1) / (2 * (prob_fail1 + prob_success1) + 50000)
    utility[2, 1] = (f1 - f5) / ((sum(prob_fail5) + sum(prob_success5)) + 50000)
    utility[3, 1] = (f1 - f6) / ((sum(prob_fail6) + sum(prob_success6)) + 50000)
    utility[4, 1] = (f1 - f7) / ((sum(prob_fail7) + sum(prob_success7)) + 50000)
    utility[5, 1] = (f1 - f8) / ((sum(prob_fail8) + sum(prob_success8)) + 50000)
    utility[6, 1] = (f1 - f9) / ((sum(prob_fail9) + sum(prob_success9)) + 50000)
    utility[7, 1] = (f1 - f10) / ((sum(prob_fail10) + sum(prob_success10)) + 50000)
    utility[8, 1] = (f1 - f11) / ((sum(prob_fail11) + sum(prob_success11)) + 50000)

    utility = utility .* (10^6)
    value, index = findmax(utility) #findmax returns the maximum value and its index in Julia

    # Switch statement using if/elseif/else
    if index == 1
        println("we should have nothing")
    elseif index == 2
        println("we should have q_1 (t):Storage & Control has inspection ")
    elseif index == 3
        println("we should have q_2 (t): Distribution & Delivery has inspection")
    elseif index == 4
        println("we should have both q_1 (t):Storage & Control and q_2 (t): Distribution & Delivery has inspection")
    elseif index == 5
        println("we should have q_2,6(t):probability of failure of face mask has identical redundancy")
    elseif index == 6
        println("we should have both q_1 (t):Storage & Control has inspection  and q_2,6(t):probability of failure of face mask has identical redundancy")
    elseif index == 7
        println("we should have both q_2 (t): Distribution & Delivery has inspection  and q_2,6(t):probability of failure of face mask has identical redundancy")
    elseif index == 8
        println("we should have all q_1 (t):Storage & Control and q_2 (t): Distribution & Delivery has inspection and q_2,6(t):probability of failure of face mask has identical redundancy")
    end

    return value, index, utility  #Added a return to return the output

end
