---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/霸刀/霸刀BUFF疾速零段魔法.lua
-- 更新时间:	2016/10/5 16:36:45
-- 更新用户:	zhangyan-pc
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

	player.AddBuff(0, 99, 11338, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com