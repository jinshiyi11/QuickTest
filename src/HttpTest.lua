--http和json使用

function testHttp()
	-- 创建一个请求，并以 POST 方式发送数据到服务端
    local url = "http://hehedream.duapp.com/getfeeds"
    local request = network.createHTTPRequest(onRequestFinished, url, "POST")
    --request:addPOSTValue("KEY", "VALUE")
    
    -- 开始请求。当请求完成时会调用 callback() 函数
    request:start()
end

function onRequestFinished(event)
    local ok = (event.name == "completed")
    local request = event.request

    if not ok then
        -- 请求失败，显示错误代码和错误消息
        print(request:getErrorCode(), request:getErrorMessage())
        return
    end

    local code = request:getResponseStatusCode()
    if code ~= 200 then
        -- 请求结束，但没有返回 200 响应代码
        print(code)
        return
    end

    -- 请求成功，显示服务端返回的内容
    local response = request:getResponseString()
    --print(response)
    local data=json.decode(response)
    dump(data)
end