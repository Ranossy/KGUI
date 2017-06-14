------------------------------------------------
-- 文件名    : 基础系_接受传功BUFF.lua
-- 创建人    : CBG
-- 创建时间  : 2009-12-04
-- 用途(模块): 经脉
-- 经脉类型  : 基础系
-- 经脉名称  : 传功
-- 经脉效果  : 传功
------------------------------------------------

------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.AddBuff(0,99,1162,1,0)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com