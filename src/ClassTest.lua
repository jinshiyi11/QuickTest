--class测试

function testClass()
	p=Point.new(10,15)
	p:draw()
	
	line=Line.new()
	line:draw()
end

--class Point
Point=class("Point")

function Point:ctor(x,y)
    self.x=x or 0
    self.y=y or 0
end

function Point:draw()
    printInfo("Point:%d,%d",self.x,self.y)
end

--class Line
Line=class("Line",Point)

function Line:ctor(x1,y1,x2,y2)
    Line.super.ctor(self,x1,y1)
    self.x2=x or 0
    self.y2=y or 0
end

function Line:draw()
    printInfo("Line:%d,%d,%d,%d",self.x,self.y,self.x2,self.y2)
end
