---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/�����/�����_�����ƶ�����.lua
-- ����ʱ��:	2017/2/16 14:29:30
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if scene.dwMapID == 264 or scene.dwMapID == 272 then
			npc.AddBuff(npc.dwID, npc.nLevel, 11706, 1, 150)
		end

		if scene.dwMapID == 270 then
			npc.AddBuff(npc.dwID, npc.nLevel, 11706, 2, 150)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com