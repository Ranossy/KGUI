---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/大明宫/大明宫_傀儡_狂暴.lua
-- 更新时间:	2013/5/31 10:39:08
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSrcID)
	print("111")
	local npcthis = GetNpc(dwCharacterID)
	if not npcthis then
		return
	end
	local scene = npcthis.GetScene()
	if not scene then
		return
	end
	local tplayer = scene.GetAllPlayer()
	if tplayer then
		local playerthis = GetPlayer(tplayer[i])
		if playerthis and playerthis.nMoveState ~= MOVE_STATE.ON_DEATH then
			playerthis.PlaySfx(442, playerthis.nX, playerthis.nY, playerthis.nZ)
			playerthis.Die()
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com