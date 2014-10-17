--crypto库的使用

function testCrypto()
	result=crypto.encodeBase64("abcd")
	print(string.format("字符串abcd base64编码结果为：%s",result))
   
    result=crypto.md5("abcd")
    print(string.format("字符串abcd md5结果为：%s",result))
    
    result=crypto.encryptXXTEA("abcd","123key123")
    print(string.format("字符串abcd  XXTEA 算法加密结果为：%s",result))
    
    result=crypto.decryptXXTEA(result,"123key123")
    print(string.format("XXTEA 算法解密结果为：%s",result))

end