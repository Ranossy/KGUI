---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_技能事件_龙城铁壁_buff驱散.lua
-- 更新时间:	2013/9/11 17:08:04
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player.GetBuff(2778, 1) then
		player.DelBuff(6810, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com