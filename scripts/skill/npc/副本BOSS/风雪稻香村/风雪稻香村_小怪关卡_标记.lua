---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_С�ֹؿ�_���.lua
-- ����ʱ��:	2014/3/26 11:25:46
-- �����û�:	wangpengfei1
-- �ű�˵��:
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local playerthis = GetPlayer(nCharacterID)
	if not playerthis then
		return
	end
	if playerthis.GetDynamicSkillGroup() ~= 0 then
		playerthis.SetDynamicSkillGroup(0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com