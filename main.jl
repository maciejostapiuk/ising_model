using Plots,Random,Distributions
###
Plots.default(show = true)
J = 1 
T = 0
k_b = 1 
#for ppp in 1:10
matrix = rand([-1,1], 100,100)
matrix
mean_spin_value = zeros(5000)
#an = Plots.Animation()
for mcs in 1:1000
for iter in 1:100^2
    i = rand(DiscreteUniform(1,100))
    j = rand(DiscreteUniform(1,100))
    energy = 2*J*matrix[i,j]*(matrix[mod(i-1, 10)+1,j] + matrix[mod(i+1,10)+1, j] + matrix[i,mod(j-1,10)+1] + matrix[i, mod(j+1,10)+1])
    if energy <= 0
        matrix[i,j] *= -1
    else
        x = rand(Uniform(0,1))
        if x < exp(-energy/(T*k_b))
            matrix[i,j] *=-1
        end
    end
    mean_spin_value[mcs] += mean(matrix)
end
#Plots.frame(an)
end
heatmap(matrix)
#display(plot!(1:5000, mean_spin_value/10000,legend = false))
#ylims!(-1,1)
#end
