using Plots,Random,Distributions
###
J = 1 
T = 0
k_b = 1 
matrix = rand([-1,1], 100,100)
matrix
counter = 0 
an = Plots.Animation()
for mcs in 1:10
for iter in 1:100^2
    i = rand(DiscreteUniform(2,99))
    j = rand(DiscreteUniform(2,99))
    counter += matrix[i,j]
    energy = 2*J*matrix[i,j]*(matrix[i-1,j] + matrix[i+1, j] + matrix[i,j-1] + matrix[i, j+1])
    if energy <= 0
        matrix[i,j] *= -1
    else
        x = rand(Uniform(0,1))
        if x < exp(-energy/(T*k_b))
            matrix[i,j] *=-1
        end
    end
    heatmap(matrix)
    Plots.frame(an)
end
end
heatmap(matrix)
#1\900 * coun
gif(an,fps = 20)
###
counter/10
x = 1
-x
a = [1  2 3 ; 4 5 6]
a[1,2]