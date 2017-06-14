---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/90级奇穴/春泥消除急速buff.lua
-- 更新时间:	2013/4/23 21:48:03
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff1 = player.GetBuff(122, 1)
	local buff2 = player.GetBuff(122, 2)
	local buff3 = player.GetBuff(122, 3)
	local buff4 = player.GetBuff(122, 4)
	local buff5 = player.GetBuff(122, 5)
	local buff6 = player.GetBuff(122, 6)
	local buff7 = player.GetBuff(122, 7)
	if (not buff1) and (not buff2) and (not buff3) and (not buff4) and (not buff5) and (not buff6) and (not buff7) then
		player.DelBuff(5692, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com