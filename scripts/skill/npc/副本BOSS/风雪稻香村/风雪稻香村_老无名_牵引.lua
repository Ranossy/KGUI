---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_������_ǣ��.lua
-- ����ʱ��:	2014/4/3 14:53:26
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
	local npcBoss = scene.GetNpcByNickName("wuming")
	if npcBoss and npcBoss.bFightState == true then
		playerthis.CastSkill(9030, 1, TARGET.NPC, npcBoss.dwID)
		return
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com