---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/狼车_副驾驶技能栏BUFF脚本.lua
-- 更新时间:	2017/6/3 11:04:43
-- 更新用户:	ZHANGYAN0-PC
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local playerC = GetPlayer(player.dwControllerID)
	if playerC then--有控制者，说明是副驾驶
		if player.nGender == CHARACTER_GENDER.FEMALE then
			player.SetDynamicSkillGroup(346)
		end
		if player.nGender == CHARACTER_GENDER.MALE then
			player.SetDynamicSkillGroup(344)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com