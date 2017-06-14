---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/镇派/九转成功击退判定.lua
-- 更新时间:	2013/6/5 5:49:24
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	local player = GetPlayer(dwSkillSrcID)
	if IsPlayer(dwCharacterID)  then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	if target.nMoveState == 19 then
		--player.AddBuff(dwSkillSrcID, player.nLevel, 8620, 1, 1)
		--player.AddBuff(dwSkillSrcID, player.nLevel, 8620, 1, 1)
		player.AddBuff(dwSkillSrcID, player.nLevel, 11261, 1, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com