function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219,5)
	local cbuff = player.GetBuff(3220,5)
	local zbuff = player.GetBuff(3461,5)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907,2)
	if not tbuff and not cbuff and not zbuff then
		player.AddBuff(dwSkillSrcID,slevel,3220,5)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID)  or tbuff then
		player.AddBuff(dwSkillSrcID,slevel,4907,2)
		player.AddBuff(dwSkillSrcID,slevel,4918,2)
	end
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com