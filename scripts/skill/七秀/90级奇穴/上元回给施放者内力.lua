---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/翔鸾舞柳回内力.lua
-- 更新时间:	2013/5/1 10:10:01
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	--施放者
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--目标
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	
	if not target then
		return
	end
	if player.GetSkillLevel(5872) == 1 then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.03
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com