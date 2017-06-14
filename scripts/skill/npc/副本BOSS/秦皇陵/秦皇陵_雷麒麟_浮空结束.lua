---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_雷麒麟_浮空结束.lua
-- 更新时间:	2014/2/14 15:04:29
-- 更新用户:	zhouyixiao1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8802)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8803)
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7468, 1)
	player.DelBuff(7469, 1)
	player.DelBuff(7514,1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com