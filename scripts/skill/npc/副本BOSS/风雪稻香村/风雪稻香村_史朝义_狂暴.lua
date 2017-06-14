---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_史朝义_狂暴.lua
-- 更新时间:	2014/3/7 16:55:04
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSrcID)
	local npcBoss = GetNpc(dwCharacterID)
	if not npcBoss then
		return
	end
	local scene = npcBoss.GetScene()
	if not scene then
		return
	end
	--npcBoss.Yell("你们这是自寻死路~！")
	local tplayer = scene.GetAllPlayer()
	if tplayer then
		for i = 1, #tplayer do
			local playerthis = GetPlayer(tplayer[i])
			if playerthis then
				playerthis.Die()
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com