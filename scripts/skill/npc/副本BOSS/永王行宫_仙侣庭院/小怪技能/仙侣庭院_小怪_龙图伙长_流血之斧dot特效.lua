---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/小怪技能/仙侣庭院_小怪_龙图伙长_流血之斧dot特效.lua
-- 更新时间:	2015/8/5 19:55:01
-- 更新用户:	CHENJINGRU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.PlaySfx(678, player.nX, player.nY, player.nZ + 500)
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com