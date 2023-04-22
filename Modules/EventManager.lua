local Manager = {
    events = {

    }
}

function Manager:AddEvent(name, event, callback)
    if self.events[name] then
        warn("Already have "..name.." registered to events")
        return
    end

    self.events[name] = {
        ["event"] = event,
        ["function"] = event:Connect(callback)
    }
    return true
end

function Manager:ChangeCallback(name : string, callback)
    if self.events[name] then
        warn(name, "doesn't exists")
        return
    end

    self.events[name]["function"]:Disconnect()
    self.events[name]["function"] = self.events[name]["event"]:Connect(callback)
    return true
end

function Manager:StopEvent(name : string)
    if self.events[name] then
        warn(name, "doesn't exists")
        return
    end

    self.events[name]["function"]:Disconnect()
    self.events[name] = nil
    return true
end

function Manager:StopAll()
    for i,event in pairs(self.events) do
        event["function"]:Disconnect()
    end
end

return Manager