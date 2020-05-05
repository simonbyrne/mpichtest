using MPICH_jll

# work around SIP
cp("/usr/bin/printenv","myprintenv")

println("========================================")
println("run(`./myprintenv`)")
println("========================================")
run(`./myprintenv`)

println("========================================")
println("mpiexec(cmd -> run(`./myprintenv`); adjust_LIBPATH=false)")
println("========================================")
mpiexec(cmd -> run(`./myprintenv`); adjust_LIBPATH=false)

println("========================================")
println("mpiexec(cmd -> run(`./myprintenv`))")
println("========================================")
mpiexec(cmd -> run(`./myprintenv`))

println("========================================")
println("mpiexec(cmd -> run(`\$cmd -n 1 ./myprintenv`); adjust_LIBPATH=false)")
println("========================================")
mpiexec(cmd -> run(`$cmd -n 1 ./myprintenv`); adjust_LIBPATH=false)

println("========================================")
println("mpiexec(cmd -> run(`\$cmd -n 1 ./myprintenv`))")
println("========================================")
mpiexec(cmd -> run(`$cmd -n 1 ./myprintenv`))
