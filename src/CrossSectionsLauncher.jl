using AnsiColor

push!(LOAD_PATH, "$(pwd())/modules")
println("The Julia module load path: $(red(string(LOAD_PATH)))")

using CrossSections

CrossSections.calculate()
