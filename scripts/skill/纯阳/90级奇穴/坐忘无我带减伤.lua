---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�������Ҵ�����.lua
-- ����ʱ��:	2015/9/2 20:21:19
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.IsSkillRecipeActive(115, 1) then
		player.AddBuff(player.dwID, player.nLevel, 10112, 1)
	end
	
	--[[
	--�����ڼ�40%�ļ���Ч��
	if player.GetSkillLevel(5813) == 1 then
		print(11111111)
		player.AddBuff(dwCharacterID, player.nLevel, 2983, 2, 1)
	end
	--]]

	local lv = player.GetSkillLevel(312)
	local nSkill = player.GetKungfuMount()
	--�ֶ�Ӯ
	if player.GetSkillLevel(6469) == 1 then
		if nSkill ~= nil then
			--QC
			if nSkill.dwSkillID == 10014 then
				player.AddBuff(dwCharacterID, player.nLevel, 6090, lv, 1)
			else
				player.AddBuff(dwCharacterID, player.nLevel, 8868, lv, 1)
			end
		end
		--����
		if player.GetSkillLevel(5813) == 1 then
			--player.AddBuff(dwCharacterID, player.nLevel, 6166, 1, 1)
			player.SetTimer(1, "scripts/skill/����/90����Ѩ/�������Ҵ�����.lua", 0, 0)
		end
	else
		if nSkill ~= nil then
			if nSkill.dwSkillID == 10014 then
				player.AddBuff(dwCharacterID, player.nLevel, 134, lv, 1)
			else
				player.AddBuff(dwCharacterID, player.nLevel, 8867, lv, 1)
			end
		end

		if player.GetSkillLevel(5813) == 1 then
			--player.AddBuff(dwCharacterID, player.nLevel, 6166, 1, 1)
			player.SetTimer(1, "scripts/skill/����/90����Ѩ/�������Ҵ�����.lua", 0, 0)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.AddBuff(player.dwID, player.nLevel, 2983, 2)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com