function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1276)   --���ĸ���� ��ħ��ն��_ǰ�� �ĵȼ�
	player.CastSkill(1272,dwSkillLevel)
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com