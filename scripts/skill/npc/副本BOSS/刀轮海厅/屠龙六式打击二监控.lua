---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������ʽ��������.lua
-- ����ʱ��:	2017/3/13 14:41:19
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
	npc.CastSkill(17405, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com