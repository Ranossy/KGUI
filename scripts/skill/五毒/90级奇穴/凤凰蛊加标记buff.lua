---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/90级奇穴/凤凰蛊加标记buff.lua
-- 更新时间:	2014/7/19 21:10:27
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	if player.GetSkillLevel(9479) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 8104, 1)
	else
		if not target.GetBuff(2313, 1) then
			target.AddBuff(player.dwID, player.nLevel, 2313, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com