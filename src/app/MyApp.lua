
require("config")
require("framework.init")
require("ClassTest")
require("HttpTest")
require("CryptoTest")
require("SignalTest")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
    
    testClass()
    --testSignal()
    --testHttp()
    --testCrypto()
    
end

return MyApp
