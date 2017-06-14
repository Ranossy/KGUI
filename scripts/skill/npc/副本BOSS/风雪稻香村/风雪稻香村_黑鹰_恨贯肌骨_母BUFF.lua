
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_��ӥ_����ӳ�.lua
-- ����ʱ��:	2014/2/26 14:39:27
-- �����û�:	wangpengfei1
-- �ű�˵��:	
----------------------------------------------------------------------<

function Apply(dwCharacterID, dwSrcID)
	--print(dwCharacterID .. "_" .. dwSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if not playertarget then
		return
	end
	local scene = playertarget.GetScene()
	if not scene then
		return
	end
	local npcBOSS = scene.GetNpcByNickName("heiying")
	if npcBOSS and npcBOSS.bFightState == true then
		if scene.dwMapID == 177 then
			if playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
				playertarget.AddBuff(0, 99, 7369, 1)
			end
		else
			if playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
				playertarget.AddBuff(0, 99, 7369, 2)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com