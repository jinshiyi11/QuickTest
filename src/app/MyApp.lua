
require("config")
require("framework.init")
require("HttpTest")
import("CryptoTest")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    self:enterScene("MainScene")
    
    --testHttp()
    testCrypto()
end

return MyApp
