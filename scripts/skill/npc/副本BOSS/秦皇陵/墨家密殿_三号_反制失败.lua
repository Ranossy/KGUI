---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/墨家密殿_三号_反制失败.lua
-- 更新时间:	2014/3/14 11:35:52
-- 更新用户:	zhouyixiao1
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
	local JHbuff = player.GetBuff(7606, 1)
	if JHbuff then
		if JHbuff.nLeftActiveCount > 1 then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 3601), 6)
		end
	end

	player.SetDynamicSkillGroup(0)
	player.DelBuff(7346,1)
	--player.AddBuff(0, 99, 7628, 1, 3) --击飞换动作
	--眩晕换动作
	player.DelBuff(7609, 1)
	player.DelBuff(7610, 1)
	player.DelBuff(7611, 1)
	player.DelBuff(7623, 1)
	player.DelBuff(7624, 1)
	player.DelBuff(7625, 1)
	player.DelBuff(7626, 1)

	player.DelBuff(7606, 1)
	player.AddBuff(0,99,7793,1,1)
end

function FanZhiShiBai(player)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8950)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8951)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8952)
	player.DelBuff(7346,1)
	player.SetDynamicSkillGroup(0)
	--player.AddBuff(0, 99, 7628, 1, 3) --击飞换动作
	--眩晕换动作
	player.DelBuff(7609, 1)
	player.DelBuff(7610, 1)
	player.DelBuff(7611, 1)
	player.DelBuff(7623, 1)
	player.DelBuff(7624, 1)
	player.DelBuff(7625, 1)
	player.DelBuff(7626, 1)

	player.DelBuff(7606, 1)

	player.AddBuff(0,99,7793,1,1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com