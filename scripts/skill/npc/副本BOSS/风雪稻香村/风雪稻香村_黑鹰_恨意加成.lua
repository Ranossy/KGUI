---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_黑鹰_恨意加成.lua
-- 更新时间:	2014/2/26 14:39:27
-- 更新用户:	wangpengfei1
-- 脚本说明:	
----------------------------------------------------------------------<

function Apply(dwCharacterID, dwSrcID)
	--print(dwCharacterID .. "_" .. dwSrcID)
	local npctarget = GetNpc(dwCharacterID)
	if not npctarget then
		return
	end
	local scene = npctarget.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("heiying")
	if npcBOSS and npcBOSS.bFightState == true then
		if npctarget.nMoveState ~= MOVE_STATE.ON_DEATH then
			if npctarget.GetBuff(7518, 1) then
				npctarget.AddBuff(0, 99, 7518, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com