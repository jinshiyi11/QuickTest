signal=require("lib.signal")

Switch=class("Switch")

function Switch:ctor()
    self.signalClicked=signal.new()
end


Light=class("Light")

function Light:ctor(name,position)
    self.name=name
    self.position=position
end

function Light:turnOn()
    print("Light name:"..self.name.." at:"..self.position)
end


function testSignal()
	light1=Light.new("my light","first floor")
	light2=Light.new("jim's light","second floor")
	
	switch1=Switch.new()
    switch1.signalClicked:connect(light1,light1.turnOn)
    switch1.signalClicked:connect(light2,light2.turnOn)
	
	switch1.signalClicked()
	
	switch1.signalClicked:disconnect(light1)
    switch1.signalClicked()
    
	switch1.signalClicked:disconnect(nil,light1.turnOn)
    switch1.signalClicked()
    
    switch1.signalClicked:disconnect()
    switch1.signalClicked()
	
end