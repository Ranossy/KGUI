---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_��ӥ_�������.lua
-- ����ʱ��:	2014/1/20 11:38:50
-- �����û�:	wangpengfei1
-- �ű�˵��:	
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com