---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/�ٶ�ά��.lua
-- ����ʱ��:	2016/9/25 15:53:38
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function Apply(dwCharacterID, dwSkillSrcID)
--	print("Apply")
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		
	end
	if npc.nMoveState == MOVE_STATE.ON_STAND or npc.nMoveState == MOVE_STATE.ON_RUN or npc.nMoveState == MOVE_STATE.ON_WALK then
		npc.AddBuff(npc.dwID, npc.nLevel, 11154, 1,2)
	
	else
		npc.AddBuff(npc.dwID, npc.nLevel, 11315, 1,6)--�ƶ�
	end
--	print("UnApply")
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
--	print("OnRemove")
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com