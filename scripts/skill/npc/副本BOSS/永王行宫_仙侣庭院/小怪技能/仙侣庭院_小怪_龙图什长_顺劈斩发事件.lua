---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/小怪技能/仙侣庭院_小怪_龙图什长_顺劈斩发事件.lua
-- 更新时间:	2015/8/5 16:59:16
-- 更新用户:	CHENJINGRU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	npc.FireAIEvent(2003, 0, 0)
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com