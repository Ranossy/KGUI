---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_剑气洒脱_风唤梦删除自己.lua
-- 更新时间:	2013/6/1 23:48:41
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.GetBuff(2831, 1) then
		player.DelBuff(4676, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com