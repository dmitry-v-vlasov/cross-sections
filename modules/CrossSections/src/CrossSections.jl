module CrossSections

export calculate

using Lumberjack
using Configuration

function initialize()
    logo = Configuration.applicationLogo("logo.txt")
    LOGGER = Configuration.initializeLogging("logs/cross-sections.log")
    LOGGER.info(logo)

    CONFIGURATION = Configuration.loadConfiguration("conf/config.yaml")
    LOGGER.info(string(CONFIGURATION))
end

function calculate()
    initialize()
end

end
