function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1596)   --���ĸ���� �׹��ɽ �ĵȼ�
	--[[
	--������Ѩ�ж�Ŀ�����������˺�
	if player.GetSkillLevel(5952) == 1 then
		player.DelGroupBuff(9710, 1)	--��ɾ����
		player.CastSkill(14615, 1)
		local nbuff_mark = player.GetBuff(9710, 1)
		if nbuff_mark then
			local nbuffcount = nbuff_mark.nStackNum
			--print("nbuffcount"..nbuffcount)
			if nbuffcount ~= 0 then
				player.AddBuff(player.dwID, player.nLevel, 9711, nbuffcount)
			end
		end
	end
	--]]
	--�ͷ�AOE�˺�
	player.CastSkill(1599,dwSkillLevel)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com