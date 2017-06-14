---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/90级奇穴/渡厄力奇穴增强.lua
-- 更新时间:	2013/4/27 11:06:53
-- 更新用户:	taoli
-- 脚本说明:	
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	local lv = player.GetSkillLevel(3984) 
	if player.GetSkillLevel(6004) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 4244, lv + 4, 1)
	end

	ModityCDToUI(player, 3984, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com