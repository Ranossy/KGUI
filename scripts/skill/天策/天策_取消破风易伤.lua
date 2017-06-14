---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_取消破风易伤.lua
-- 更新时间:	2013/9/5 17:27:49
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	--[[
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
		target.DelBuff(6747, 1)
		target.DelBuff(6747, 2)
	else
		target = GetNpc(dwCharacterID)
		target.DelBuff(6747, 1)
		target.DelBuff(6747, 2)
	end
	--]]
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com