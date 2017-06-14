---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_��ӥ_����ӳ�.lua
-- ����ʱ��:	2014/2/26 14:39:27
-- �����û�:	wangpengfei1
-- �ű�˵��:	
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com