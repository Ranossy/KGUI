---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/90级奇穴/握针回蓝.lua
-- 更新时间:	2013/4/23 14:30:01
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwSrcID)
	if not player then 
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		return
	end
	if not target then
		return
	end

	--给目标和自己回来
	if player.GetSkillLevel(5794) == 1 then
		target.nCurrentMana = target.nMaxMana * 0.01 + target.nCurrentMana
		--target.nCurrentMana = target.nMaxMana * 0.01 + target.nCurrentMana
	end

	--[[
	if player.GetSkillLevel(5783) == 1 and not target.GetBuff(7668, 1) and target.nCurrentLife <= target.nMaxLife * 0.3 then
		--print("11111111")
		target.AddBuff(player.dwID, player.nLevel, 7689, 1)
		if target.GetBuff(7689, 1) then
			local buff = target.GetBuff(7689, 1)
			buff.nCustomValue = player.dwID
			--print("buff.nCustomValue")
		end
		--player.CastSkill(9015, 1, TARGET.PLAYER, target.dwID)
		target.AddBuff(0,99,7668,1)
   	end
	--]]
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com