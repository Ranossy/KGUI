---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/长安内城沈眠风/水毒驱散.lua
-- 更新时间:	2013/9/6 11:12:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	--if player.nMoveState ~= 16 then
	--player.nCurrentMana = player.nCurrentMana + 20000
	--player.AddBuff(dwCharacterID, player.nLevel, 6520, 1, 1)
	--end
end
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 and player.nMoveState ~= 16 then
		player.nCurrentMana = player.nCurrentMana + 20000
		player.AddBuff(dwCharacterID, player.nLevel, 6520, 1, 1)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com