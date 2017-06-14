---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/骑乘的滑翔监控_魔法.lua
-- 更新时间:	2015/7/16 17:02:49
-- 更新用户:	zhangyan3
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.SetTurnRange(128, 128, 64, -64)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com