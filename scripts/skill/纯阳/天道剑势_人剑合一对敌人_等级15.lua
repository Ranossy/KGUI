Include("scripts/Include/Skill.lh")

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if tQichangNpcID[npc.dwTemplateID] and tQichangNpcID[npc.dwTemplateID] == 1 then
		npc.CastSkill(3785, 15)
		npc.SetModelID(3987)
		npc.SetDisappearFrames(12, false)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com