---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/90级奇穴/归寂道减伤.lua
-- 更新时间:	2013/4/27 11:47:00
-- 更新用户:	taoli
-- 脚本说明:	
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end
	
	if player.GetSkillLevel(6006) == 1 then
		player.AddBuff(dwSkillSrcID, player.nLevel, 5750, 1, 1)
	end

	if player.GetSkillLevel(14680) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 9746, 1, 6)	--6秒30%降低效果
		target.AddBuff(player.dwID, player.nLevel, 4428, 1, 6)	--6秒50%减速效果
	else
		local nlev = player.GetSkillLevel(3981)
		if nlev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 4429, nlev)	--12秒10%降低伤害效果
			target.AddBuff(player.dwID, player.nLevel, 4428, 1, 12)	--12秒50%减速效果
		end
	end

	ModityCDToUI(player, 3981, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com