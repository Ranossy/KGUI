---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������ʽ�����1.lua
-- ����ʱ��:	2017/2/23 15:22:48
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	npc.DoAction(0, 10066)
	npc.CastSkill(17410, 1)
	npc.AddBuff(npc.dwID, npc.nLevel, 11739, 1)		--�����2���
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com