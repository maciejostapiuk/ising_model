using Plots;
###
Plots.default(show = true)
#J = 1 
#T = 1.85
#N = 1000
#p = 100
#an = Plots.Animation()

function ising_model(T, N, p)
#plt = plot()
for _ in 1:10
    matrix = rand([-1,1], p,p)
    mean_spin_value = zeros(N)
    for mcs in 1:N
        for iter in 1:p^2
            i = rand(1:p)
            j = rand(1:p)
            energy = 2*matrix[i,j]*(matrix[mod1(i-1, p),j] + matrix[mod1(i+1,p), j] + matrix[i,mod1(j-1,p)] + matrix[i, mod1(j+1,p)])
            if energy <= 0
                matrix[i,j] *= -1
            else
                x = rand()
                if x < exp(-energy/T)
                    matrix[i,j] *=-1
                end
            end
            mean_spin_value[mcs] = sum(matrix)/p^2
    end
    plot!(1:N, mean_spin_value,legend = false)
    end
    end
end
ising_model(1.85, 3000, 10)