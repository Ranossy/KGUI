---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_黑鹰_疾风怒羽_定身.lua
-- 更新时间:	2014/1/17 10:33:43
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.Stop()
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com