---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/挂件_七彩风车维持.lua
-- 更新时间:	2016/5/25 19:24:27
-- 更新用户:	xutong3
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.GetDynamicSkillGroup() == 259 then
		player.SetDynamicSkillGroup(0)	
	end
end
function OnRemove(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.GetDynamicSkillGroup() == 259 then
		player.SetDynamicSkillGroup(0)	
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com