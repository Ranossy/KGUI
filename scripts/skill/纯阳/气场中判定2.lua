---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/气场中判定2.lua
-- 更新时间:	2013/5/28 11:05:29
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
	local buff4 = 0
	local buff5 = 0
	--破苍穹
	if player.GetBuff(375, 10) or player.GetBuff(375, 5) or player.GetBuff(9964, 1) then
		buff1 = 1
	end
	--冲阴阳
	if player.GetBuff(376, 1) or player.GetBuff(376, 2) then
		buff2 = 1
	end
	--生态极
	if  player.GetBuff(374, 1) then
		buff3 = 1
	end
	--化三清
	if  player.GetBuff(373, 1) or player.GetBuff(9957, 1) then
		buff4 = 1
	end
	--镇山河
	if  player.GetBuff(377, 1) then
		buff5 = 1
	end
	if buff1 + buff2 + buff3+buff4+buff5 >= 1 then
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