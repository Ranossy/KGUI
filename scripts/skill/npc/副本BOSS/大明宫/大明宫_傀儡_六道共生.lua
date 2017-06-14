---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/大明宫/大明宫_傀儡_六道共生.lua
-- 更新时间:	2013/5/30 14:30:42
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc.nCurrentLife > npc.nMaxLife * 0.99 then
		npc.nCurrentLife = npc.nMaxLife
	else
		npc.nCurrentLife = npc.nMaxLife * 0.005 + npc.nCurrentLife
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com