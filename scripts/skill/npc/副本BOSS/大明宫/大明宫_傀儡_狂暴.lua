---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_����_��.lua
-- ����ʱ��:	2013/5/31 10:39:08
-- �����û�:	wangpengfei1
-- �ű�˵��:	
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com