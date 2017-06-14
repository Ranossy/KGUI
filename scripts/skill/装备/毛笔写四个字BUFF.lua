---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/装备/毛笔写四个字BUFF.lua
-- 更新时间:	2014/12/10 17:45:18
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.ResetCD(851)--
	player.NotifyPainting(player.dwID, 0)
	player.SetDynamicSkillGroup(0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com