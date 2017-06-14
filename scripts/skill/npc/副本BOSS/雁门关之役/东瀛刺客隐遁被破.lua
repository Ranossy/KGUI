---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/东瀛刺客隐遁被破.lua
-- 更新时间:	2014/10/20 20:21:27
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.nCurrentLife < npc.nMaxLife then
		npc.DelBuff(8411, 1)
		npc.FireAIEvent(2002, 0, 0)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com