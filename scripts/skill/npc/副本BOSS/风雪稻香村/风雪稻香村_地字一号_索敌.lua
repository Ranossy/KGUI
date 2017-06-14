---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_地字一号_索敌.lua
-- 更新时间:	2014/1/6 10:18:23
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<


function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("BOSS_diziyihao")
	if npcBOSS then
		npcBOSS.FireAIEvent(2011, 0, dwCharacterID)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com