using Plots
using DelimitedFiles
###
Plots.default(show = true)
function ising_model(T, N, p)
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
        end
        #writedlm("spins_configuration.txt", matrix)
        #writedlm("trajectories.txt", mean_spin_value)
        return mean_spin_value
    end

### Trajectories for T == 0, p = 100 
#
plt = plot();
for i in 1:10
    res = ising_model(0,5000,100)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 0")
xlabel!("time[MCS]")
ylabel!("E")
display(plt)
savefig("trajectories_T=0_L=100")
###
### Trajectories for T == 1, p = 10
#
plt = plot();
for i in 1:10
    res = ising_model(1,5000,10)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1_L=10");
###

### Trajectories for T == 1, p = 20
#
plt = plot();
for i in 1:10
    res = ising_model(1,5000,20)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1_L=20");
###
### Trajectories for T == 1, p = 40
#
plt = plot();
for i in 1:10
    res = ising_model(1,5000,40)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1_L=40");
###
### Trajectories for T == 1, p = 80
#
plt = plot();
for i in 1:10
    res = ising_model(1,5000,80)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1_L=80");
###
Plots.default(show = true)

function ising_model_current_configuration(T, N, p)
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
        end
        #writedlm("spins_configuration.txt", matrix)
        #writedlm("trajectories.txt", mean_spin_value)
        return matrix
    end


### current config for T = 1
### a) L = 10 
res = ising_model_current_configuration(1, 100, 10)
heatmap(res);
title!("100 MCS, T = 1, sieć 10 x 10");
savefig(("100 MCS, T = 1, sieć 10 x 10"));
### b) L = 80
res = ising_model_current_configuration(1, 100, 80)
heatmap(res);
title!("100 MCS, T = 1, sieć 80 x 80");
savefig(("100 MCS, T = 1, sieć 80 x 80"));
###

### current config for T = 2.26
### a) L = 10
res = ising_model_current_configuration(2.26, 100, 10)
heatmap(res);
title!("100 MCS, T = 2.26, sieć 10 x 10");
savefig(("100 MCS, T = 2,26, sieć 10 x 10"));
###b) L = 80
res = ising_model_current_configuration(2.26, 100, 80)
heatmap(res);
title!("100 MCS, T = 2.26, sieć 80 x 80");
savefig(("100 MCS, T = 2,26, sieć 80 x 80"));

### current config for T = 4
### a) L = 10
res = ising_model_current_configuration(4, 100, 10)
heatmap(res);
title!("100 MCS, T = 4, sieć 10 x 10");
savefig(("100 MCS, T =4, sieć 10 x 10"));
###b) L = 80
res = ising_model_current_configuration(4, 100, 80)
heatmap(res);
title!("100 MCS, T = 4, sieć 80 x 80");

### Trajectories for T == 1.85, p = 10
#
plt = plot();
for i in 1:10
    res = ising_model(1.85,5000,10)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T= 1,85");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1,85_L=10");
###

### Trajectories for T == 1.85, p = 20
#
plt = plot();
for i in 1:10
    res = ising_model(1.85,5000,20)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1,85");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1,85_L=20");
###
### Trajectories for T == 1.85, p = 40
#
plt = plot();
for i in 1:10
    res = ising_model(1.85,5000,40)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1,85");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1,85_L=40");
###
### Trajectories for T == 1.85, p = 80
#
plt = plot();
for i in 1:10
    res = ising_model(1.85,5000,80)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 1,85");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=1,85_L=80");
###


### Trajectories for T == 2.27, p = 10
#
plt = plot();
for i in 1:10
    res = ising_model(2.27,5000,10)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T=2,27 = 1");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=2,27_L=10");
###

### Trajectories for T == 2.27, p = 20
#
plt = plot();
for i in 1:10
    res = ising_model(2.27,5000,20)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 2,27");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=2,27_L=20");
###
### Trajectories for T == 2,27, p = 40
#
plt = plot();
for i in 1:10
    res = ising_model(2.27,5000,40)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 2,27");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=2,27_L=40");
###
### Trajectories for T == 2,27, p = 80
#
plt = plot();
for i in 1:10
    res = ising_model(2.27,5000,80)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 2,27");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=2,27_L=80");
###

### Trajectories for T == 2,27, p = 80
#
plt = plot();
for i in 1:10
    res = ising_model(3,50000,80)
    plot!(1:50000, res, legend = false)
end
title!("trajectories for T = 3");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=3_L=80");
###

### Trajectories for T == 4.8, p = 10
#
plt = plot();
for i in 1:10
    res = ising_model(4.8,5000,10)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T=4,8");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=4,8_L=10");
###

### Trajectories for T == 4.8, p = 20
#
plt = plot();
for i in 1:10
    res = ising_model(4.8,5000,20)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 4,8");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=4,8_L=20");
###
### Trajectories for T == 4,8, p = 40
#
plt = plot();
for i in 1:10
    res = ising_model(4.8,5000,40)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 4,8");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=4,8_L=40");
###
### Trajectories for T == 4,8, p = 80
#
plt = plot();
for i in 1:10
    res = ising_model(4.8,5000,80)
    plot!(1:5000, res, legend = false)
end
title!("trajectories for T = 4,8");
xlabel!("time[MCS]");
ylabel!("E");
savefig("trajectories_T=4,8_L=80");
###
rnge = 0.5:0.1:3.5
### plot Magnetisation of T
plt = plot(); 
results_10 = [1/100*sum(1/10*abs(sum([ising_model(elem, 100,10) for _ in 1:10]))) for elem in rnge]
results_20 = [1/100*sum(1/10*sum([ising_model(elem, 100,20) for _ in 1:10])) for elem in rnge]
results_40 = [1/100*sum(1/10*sum([ising_model(elem, 100,40) for _ in 1:10])) for elem in rnge]
results_80 = [1/100*sum(1/10*sum([ising_model(elem, 100,80) for _ in 1:10])) for elem in rnge]
plot!(rnge, results_10, label = "L = 10")
scatter!(rnge, abs.(results_20), label = "L = 20")
plot!(rnge, results_40, label = "L = 40")
plot!(rnge, results_80, label = "L = 80")
xlabel!("T")
ylabel!("m");
title!("m(T)");
savefig("megnetization of temperature");
heatmap(rand([-1,1], 10,10))
title!("0 MCS")
savefig("0_mcs_10")

heatmap(rand([-1,1], 80,80))
title!("0 MCS")
savefig("0_mcs_80")     