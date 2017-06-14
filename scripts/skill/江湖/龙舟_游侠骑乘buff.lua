---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/龙舟_游侠骑乘buff.lua
-- 更新时间:	2017/5/20 19:44:07
-- 更新用户:	xutong1-pc
-- 脚本说明:
----------------------------------------------------------------------<
--Include("scripts/Map/节日端午/include/端午龙舟大战头文件.lua")

--------------脚本文件开始------------------------------------------------
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(337)
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