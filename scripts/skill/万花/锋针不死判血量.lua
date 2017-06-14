---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/锋针不死判血量.lua
-- 更新时间:	2013/5/20 16:51:53
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = GetPlayer(dwSkillSrcID)
	if not target then
		player.DelBuff(5970, 1)
		return
	end

	if player.nCurrentLife <= player.nMaxLife * 0.01 then
		if player.GetScene().dwID == target.GetScene().dwID and player.GetScene().dwMapID == target.GetScene().dwMapID then
			if dwSkillSrcID == dwCharacterID or IsParty(dwCharacterID, dwSkillSrcID) then
				player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.5
				player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.5
				player.PlaySfx(505, player.nX, player.nY, player.nZ)
			end
			--[[
			--附魔离经心法下缝针额外效果
			if target.GetSkillLevel(9324) == 1 and target.GetKungfuMount() ~= nil and target.GetKungfuMount().dwSkillID == 10028 then
				player.AddBuff(player.dwID,player.nLevel,7985,1)
			end
			--]]
		end
		player.DelBuff(5970, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com