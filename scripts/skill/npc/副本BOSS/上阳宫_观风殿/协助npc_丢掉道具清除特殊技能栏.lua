---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/Э��npc_��������������⼼����.lua
-- ����ʱ��:	2016/8/26 16:18:00
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if player.GetItemAmount(5, 26719) < 1 then
			player.SetDynamicSkillGroup(0)
			player.DelBuff(11131, 1)
			local LiFu = scene.GetNpcByNickName("LiFu")
			local LiChengEn = scene.GetNpcByNickName("LiChengEn")
			if LiFu then
				LiFu.DelBuff(11345, 1)
			end

			if LiChengEn then
				LiChengEn.DelBuff(11345, 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com