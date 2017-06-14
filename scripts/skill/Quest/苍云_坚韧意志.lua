---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/苍云_坚韧意志.lua
-- 更新时间:	2014/11/20 23:57:24
-- 更新用户:	zhangtianhui1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 8577, 1)
	RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
	player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/Quest/苍云_坚韧意志.lua", 0, 0)
end

function OnTimer(player, nParam1, nParam2)
	player.SetPosition(25158, 7465, 1017464)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com