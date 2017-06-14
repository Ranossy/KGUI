---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_黑鹰_坐困愁城.lua
-- 更新时间:	2014/1/20 11:38:50
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

function Apply(dwCharacterID, dwSkillSrcID)
	local playerthis = GetPlayer(dwCharacterID)
	if not playerthis then
		return
	end
	local scene = playerthis.GetScene()
	if not scene then
		return
	end
	local npcBoss = scene.GetNpcByNickName("heiying")
	if npcBoss and npcBoss.bFightState == true then
		if playerthis.nMoveState ~= MOVE_STATE.ON_DEATH then
			playerthis.DieByKiller(npcBoss.dwID)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com