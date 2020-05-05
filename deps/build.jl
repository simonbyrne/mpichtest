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


paths = [
    "/Users/travis/julia/bin/../lib/julia"
    "/Users/travis/julia/bin/../lib"
    "/Users/travis/.julia/artifacts/7c9ef733699a1d86b8a6073ed08a4457e3e790f7/lib"
    "/Users/travis/.julia/artifacts/0fa85a44ee97edebd281cf5b65ff4f6009aaa15e/lib"
]


run(Cmd(`$(Base.julia_cmd()) --version`; env=Dict("DYLD_FALLBACK_LIBRARY_PATH"=>join(paths[1:1],':'))))
run(Cmd(`$(Base.julia_cmd()) --version`; env=Dict("DYLD_FALLBACK_LIBRARY_PATH"=>join(paths[1:2],':'))))
run(Cmd(`$(Base.julia_cmd()) --version`; env=Dict("DYLD_FALLBACK_LIBRARY_PATH"=>join(paths[1:3],':'))))
run(Cmd(`$(Base.julia_cmd()) --version`; env=Dict("DYLD_FALLBACK_LIBRARY_PATH"=>join(paths[1:4],':'))))



println("========================================")
println("mpiexec(cmd -> run(`julia --version`))")
println("========================================")
mpiexec(cmd -> run(`$(Base.julia_cmd()) --version`))


println("========================================")
println("mpiexec(cmd -> run(`\$cmd -n 1 julia --version`))")
println("========================================")
mpiexec(cmd -> run(`$cmd -n 1 $(Base.julia_cmd()) --version`))


