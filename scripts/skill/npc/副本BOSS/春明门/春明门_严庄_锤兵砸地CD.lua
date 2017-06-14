---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/春明门/春明门_严庄_锤兵砸地CD.lua
-- 更新时间:	2014/5/23 10:38:22
-- 更新用户:	ks13376-PC
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