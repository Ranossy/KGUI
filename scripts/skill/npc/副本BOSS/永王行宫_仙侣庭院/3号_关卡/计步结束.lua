---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/3号_关卡/计步结束.lua
-- 更新时间:	2015/6/25 10:56:27
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local Target = GetNpc(dwCharacterID)
	if not Target then
		return
	end

	Target.FireAIEvent(2001, 0, 0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com