---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/90级奇穴/盾强飞回主角.lua
-- 更新时间:	2014/10/16 16:58:05
-- 更新用户:	zhouyixiao2
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 8399, 1, 1) --回盾标记

	if player.GetBuff(9176, 1) then
		player.DelBuff(9176, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com