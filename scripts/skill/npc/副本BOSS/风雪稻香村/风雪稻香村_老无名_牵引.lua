---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_老无名_牵引.lua
-- 更新时间:	2014/4/3 14:53:26
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
	local npcBoss = scene.GetNpcByNickName("wuming")
	if npcBoss and npcBoss.bFightState == true then
		playerthis.CastSkill(9030, 1, TARGET.NPC, npcBoss.dwID)
		return
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com