---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/����԰_��������_����.lua
-- ����ʱ��:	2016/9/16 22:34:20
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if not npc.bFightState then
		npc.CastSkill(16796, 1)
	end
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if npc then
		npc.AddBuff(0, 99, 11240, 1, 1000)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com