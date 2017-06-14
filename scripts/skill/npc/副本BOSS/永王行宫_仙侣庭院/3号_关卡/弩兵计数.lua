---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/3号_关卡/弩兵计数.lua
-- 更新时间:	2015/8/26 20:46:03
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	print("script entered")
	local Target = GetNpc(dwCharacterID)
	if not Target then
		return
	end

	Target.CastSkill(14529, 1)
	
	if Target.GetCustomInteger1(1) > 0 and Target.GetCustomInteger1(1) <= 5 then
		Target.FireAIEvent(2001, 0, 0)
	elseif Target.GetCustomInteger1(1) > 5 then
		Target.FireAIEvent(2002, 0, 0)
	end

	--Target.AddBuff(0, 99, 9565, 1)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com