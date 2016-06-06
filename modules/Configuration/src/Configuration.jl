module Configuration

using Lumberjack
using YAML

type Config
    name::AbstractString
    atoms::AbstractArray{AbstractString}
end

type ConfigQuantumChemicalData
    adiabaticPotentials
end

type ConfigInputData
    quantumChemicalData::ConfigQuantumChemicalData
    ConfigInputData(quantumChemicalData::ConfigQuantumChemicalData) = new(quantumChemicalData)
end


function applicationLogo(logoFilename::AbstractString="logo.txt")
    return "\n$(readall(logoFilename))"
end

function initializeLogging(logFilename::AbstractString="logs/cross-sections.log")
    Lumberjack.configure(; modes=["debug", "info", "notice", "warn", "error", "crit", "alert", "emerg"])
    Lumberjack.add_truck(LumberjackTruck(STDOUT, nothing, Dict{Any, Any}(:is_colorized => true)), "console")
    Lumberjack.add_truck(LumberjackTruck(logFilename), "file:$(logFilename)")
    return Lumberjack
end

function loadConfiguration(configurationFilename::AbstractString="conf/config.yaml")
    return YAML.load(open(configurationFilename))
end

export applicationLogo, initializeLogging, loadConfiguration
end
