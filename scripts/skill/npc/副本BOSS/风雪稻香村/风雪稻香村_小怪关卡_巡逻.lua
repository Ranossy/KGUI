---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_小怪关卡_巡逻.lua
-- 更新时间:	2014/4/20 21:36:39
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local npcthis = GetNpc(dwCharacterID)
	if not npcthis then
		return
	end
	npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com