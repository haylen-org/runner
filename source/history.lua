-- The addresses the runner opened, each once, from the most recent to the oldest, kept in the preferences of the app between runs.
local preferences = require('haylen.preferences')

local history = {}

history.key = 'history'
history.limit = 30

function history.list()
    return preferences.get(history.key, {})
end

-- Moves the address to the top of the list, or puts it there, and forgets the oldest past the limit.
function history.add(url)
    local list = {url}
    for _, entry in ipairs(history.list()) do
        if entry ~= url and #list < history.limit then
            list[#list + 1] = entry
        end
    end
    preferences.set(history.key, list)
    preferences.save()
end

function history.remove(url)
    local list = {}
    for _, entry in ipairs(history.list()) do
        if entry ~= url then
            list[#list + 1] = entry
        end
    end
    preferences.set(history.key, list)
    preferences.save()
end

return history
