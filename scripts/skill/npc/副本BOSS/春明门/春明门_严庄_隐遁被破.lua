---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_隐遁被破.lua
-- 更新时间:	2014/5/28 15:20:42
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.nCurrentLife < npc.nMaxLife then
		npc.DelBuff(7866, 1)
		npc.FireAIEvent(2001, 0, 0)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com