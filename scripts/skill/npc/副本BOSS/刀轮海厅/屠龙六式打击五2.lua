---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������ʽ�����2.lua
-- ����ʱ��:	2017/2/23 15:26:51
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	npc.CastSkill(17410, 1)
	npc.AddBuff(npc.dwID, npc.nLevel, 11740, 1)		--�����3���
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com