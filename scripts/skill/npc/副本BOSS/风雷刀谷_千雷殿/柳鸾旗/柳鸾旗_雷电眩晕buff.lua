---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_�׵�ѣ��buff.lua
-- ����ʱ��:	2017/2/27 15:37:37
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local playertarget = GetPlayer(dwCharacterID)
	if playertarget then
		if playertarget.nMoveState ~= MOVE_STATE.ON_HALT then
			playertarget.DelBuff(11556, 1)
			playertarget.DelBuff(11556, 2)
		end
	end

	local npctarget = GetNpc(dwCharacterID)
	if npctarget then
		if npctarget.nMoveState ~= MOVE_STATE.ON_HALT then
			npctarget.DelBuff(11556, 1)
			npctarget.DelBuff(11556, 2)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com