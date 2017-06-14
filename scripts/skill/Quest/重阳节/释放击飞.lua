---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/重阳节/释放击飞.lua
-- 更新时间:	2014/9/3 16:35:19
-- 更新用户:	renjei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	print("skillllllllllllllllll")
	local npcBoss = GetNpc(dwCharacterID)
	if not npcBoss then
		return
	end
	npcBoss.CastSkill(13029, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com