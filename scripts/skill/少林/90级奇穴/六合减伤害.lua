---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/90级奇穴/六合减伤害.lua
-- 更新时间:	2013/4/25 17:13:31
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(5925) == 1 then
		if player.IsSkillRecipeActive(257, 1) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 5708, 1, 18)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 5708, 1, 12)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com