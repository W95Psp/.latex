Todo = {list = {}}
function Todo:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self -- o.todoMethod --> o.__metatable.__index.todoMethod
	self.list[#self.list + 1] = o
	return o
end
function Todo:print()
	tex.print("\\subsection*{At page ".. self.page .."}")
	tex.print(self.content);
end

function Todo:nonEmpty()
   return #self.list~=0
end

function Todo:printSummary()
	if #self.list==0 then return end
	chapter = "\\color{orange} Warning: todo list not empty! (" .. #self.list .. ")"
	tex.print("\\addcontentsline{toc}{chapter}{".. chapter .. "}")
	tex.print("\\chapter*{" .. chapter .. "}")
	for _, v in ipairs(self.list) do
		v:print()
	end
end
