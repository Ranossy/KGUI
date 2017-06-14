---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/双人酒船_乘骑buff脚本.lua
-- 更新时间:	2016/9/27 15:29:17
-- 更新用户:	FENGMENGJIE
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(307)
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