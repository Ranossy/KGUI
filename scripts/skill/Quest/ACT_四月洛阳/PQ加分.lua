---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ACT_��������/PQ�ӷ�.lua
-- ����ʱ��:	2016/4/27 15:25:30
-- �����û�:	zhengfeng4
-- �ű�˵��:
----------------------------------------------------------------------<

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc.bFightState then
		return
	end

	npc.CastSkill(15866, 1)
	npc.PlaySfx(386, npc.nX, npc.nY, npc.nZ + 140)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com