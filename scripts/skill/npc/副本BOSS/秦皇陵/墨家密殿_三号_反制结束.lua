---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/墨家密殿_三号_反制结束.lua
-- 更新时间:	2014/3/10 21:41:34
-- 更新用户:	xiedixun2
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8950)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8951)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8952)
	player.SetDynamicSkillGroup(0)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com