---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/10�㽣��ӹ���.lua
-- ����ʱ��:	2013/7/29 11:34:24
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--����Ч��
	if player.GetSkillLevel(6567) == 1 then
		--[[
		if (not player.GetBuff(5970, 1)) and player.nCurrentLife > player.nMaxLife * 0.01 and (not player.GetBuff(6183, 1)) then
			player.AddBuff(player.dwID, player.nLevel, 6179, 1, 10)
		end
		--]]
		if player.nCurrentLife > player.nMaxLife * 0.01 and (not player.IsHaveBuff(6183, 1)) then
			player.AddBuff(player.dwID, player.nLevel, 6179, 1, 10)	--��Ӽ����ж�Ч��
		end
	end
	--[[if player.GetSkillLevel(6571) == 1 then
		if player.bFightState and (not player.GetBuff(6187, 1)) then
			if player.nAccumulateValue == 10 then
				player.ClearCDTime(123)
				player.AddBuff(dwCharacterID, player.nLevel, 6187, 1, 1)
			end
		end
	end--]]
	local n = player.nAccumulateValue
	local m = 10
	if player.GetSkillLevel(5882) == 1 then
		for i = 1, 10 do
			player.DelBuff(6228, 1)
		end
		for i = 1, n do
			player.AddBuff(dwCharacterID, player.nLevel, 6228, 1, 1)
		end
	end
	--��¶���AP
	if player.GetSkillLevel(6779) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 and not player.IsHaveBuff(9766, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9766, 1)
		end
		--[[
		if player.bFightState and (not player.GetBuff(6320, 1)) then
			if player.nAccumulateValue == 10 then
				--player.ClearCDTime(123)
				player.AddBuff(dwCharacterID, player.nLevel, 6319, 1, 1)	--ÿ��1%���� ����6��
				player.AddBuff(dwCharacterID, player.nLevel, 6320, 1, 1)	--����CD
			end
		end
		--]]
	end
	--������вֵ������
	if player.GetSkillLevel(6847) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 and (not player.IsHaveBuff(9767, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 9768, 1, 1)	--����40%��в
			player.AddBuff(dwCharacterID, player.nLevel, 9767, 1, 1)	--����CD
		end
		--[[
		if player.bFightState and (not player.GetBuff(6430, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 6384, 1, 1)	--����40%��в
			player.AddBuff(dwCharacterID, player.nLevel, 6430, 1, 1)	--����CD
		end
		--]]
	end

	--10�㽣�����ӽ�������˺�
--[[
	if player.GetSkillLevel(14715) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 then
			if not player.GetBuff(9926, 1) then
				player.AddBuff(player.dwID, player.nLevel, 9926, 1)
			end
		else
			if player.GetBuff(9926, 1) then
				player.DelBuff(9926, 1)
			end
		end
	end
--]]
	--10�㽣�����ӽ�������˺�
	if player.GetSkillLevel(14939) == 1 then
		if player.bFightState and player.nAccumulateValue == 10 then
			if not player.IsHaveBuff(9929, 1) then
				player.AddBuff(player.dwID, player.nLevel, 9929, 1)
			end
		else
			if player.IsHaveBuff(9929, 1) then
				player.DelBuff(9929, 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com