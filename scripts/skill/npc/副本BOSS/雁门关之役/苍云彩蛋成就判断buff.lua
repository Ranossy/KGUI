---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/苍云彩蛋成就判断buff.lua
-- 更新时间:	2014/11/17 19:49:52
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.nCurrentLife < npc.nMaxLife * 0.95 then
		if npc.GetBuff(8636, 1) then
			npc.DelBuff(8636, 1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com