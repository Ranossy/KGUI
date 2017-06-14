---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/气场中判定1.lua
-- 更新时间:	2013/5/27 20:14:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff1 = 0
	local buff2 = 0
	local buff3 = 0
	--碎星辰
	if player.GetBuff(2930, 7) or player.GetBuff(378, 7) or player.GetBuff(9951, 1) then
		buff1 = 1
	end
	--凌太虚
	if player.GetBuff(2928, 5) or player.GetBuff(561, 5) then
		buff2 = 1
	end
	--生太极
	if  player.GetBuff(374, 1) then
		buff3 = 1
	end
	if buff1 + buff2+buff3 >= 1 then
		if player.GetSkillLevel(6471) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6092, 1, 1)
		end
		if player.GetSkillLevel(6472) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6093, 1, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com