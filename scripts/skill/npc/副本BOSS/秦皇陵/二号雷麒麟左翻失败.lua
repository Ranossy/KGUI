---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/二号雷麒麟左翻失败.lua
-- 更新时间:	2014/4/3 17:25:12
-- 更新用户:	zhouyixiao2
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
	player.DelBuff(7346, 1) --击飞换动作
	player.DelBuff(7468, 1) --窗口弹出限制
	player.DelBuff(7469, 1) --左需求
	player.DelBuff(7514, 1) --右需求
	player.DelBuff(7710, 1) --左失败标记
	player.DelBuff(7711, 1) --右失败标记
	player.DelBuff(7467, 1) --反制机会
end

function FanZhiShiBai(player)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8802)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_HitNotify", 8803)
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7346, 1) --击飞换动作
	player.DelBuff(7468, 1) --窗口弹出限制
	player.DelBuff(7469, 1) --左需求
	player.DelBuff(7514, 1) --右需求
	player.DelBuff(7710, 1) --左失败标记
	player.DelBuff(7711, 1) --右失败标记
	player.DelBuff(7467, 1) --反制机会
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com