function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1275)   --���ĸ���� ��ħ��ն��_ǰǰ �ĵȼ�
	player.CastSkill(1271,dwSkillLevel)
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com