---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/唐门/90级奇穴/裂石弩回能量.lua
-- 更新时间:	2013/5/12 10:30:44
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5888, 1)
	if not buff then
		return
	end
	player.nCurrentEnergy = player.nCurrentEnergy + buff.nStackNum * 3
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com