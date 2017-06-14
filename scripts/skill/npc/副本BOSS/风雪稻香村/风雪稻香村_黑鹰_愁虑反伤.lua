---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雪稻香村/风雪稻香村_黑鹰_愁虑反伤.lua
-- 更新时间:	2014/4/22 15:40:29
-- 更新用户:	wangpengfei1
-- 脚本说明:
----------------------------------------------------------------------<

function Apply(dwCharacterID, dwSrcID)
	--print(dwCharacterID)
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
			if scene.dwMapID == 177 then
				local buffthis = npctarget.GetBuff(7517, 1)
				if buffthis then
					if buffthis.nStackNum >= 20 then
						if not npctarget.GetBuff(7809, 1) then
							npctarget.AddBuff(0, 99, 7809, 1)
						end
					end
					npctarget.AddBuff(0, 99, 7517, 1)
				end
			else
				local buffthis = npctarget.GetBuff(7517, 2)
				if buffthis then
					if buffthis.nStackNum >= 20 then
						if not npctarget.GetBuff(7809, 2) then
							npctarget.AddBuff(0, 99, 7809, 2)
						end
					end
					npctarget.AddBuff(0, 99, 7517, 2)
				end
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com