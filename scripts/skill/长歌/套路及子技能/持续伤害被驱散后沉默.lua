---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�����˺�����ɢ���Ĭ.lua
-- ����ʱ��:	2015/8/5 23:00:36
-- �����û�:	mengxiangfei11
-- �ű�˵��:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(dwSkillSrcID)		--buff�ͷ���
	local Cast_player
	if IsPlayer(dwCasterID) then
		Cast_player = GetPlayer(dwCasterID)
	else
		Cast_player = GetNpc(dwCasterID)
	end
	
	local target								--buff������
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
	else
		target = GetNpc(nCharacterID)
	end
	
	if player and Cast_player and target and player.GetSkillLevel(14313) == 1 and nLeftFrame ~= 0 then
		if player.bFightState == true or Cast_player.bFightState == true or target.bFightState == true then
			--print(111)
			--��buff��ɢ������ӳ�buff
			if IsPlayer(dwCasterID) then
				--print(11111111111111111111)
				Cast_player.AddBuff(0, 99, 9379, 1)
			else
				--print(222)
				--print(222222222222222222222)
				if Cast_player.GetEmployer() then
					--print(333333)
					--print(333333333333333333)
					Cast_player.GetEmployer().AddBuff(0, 99, 9379, 1)
				else
					--print(4444444444444)
					Cast_player.AddBuff(0, 99, 9379, 1)
				end
			end
		end
	end

	--ɾ����hot�Ļ������buff
	if BuffID == 9463 or BuffID == 9464 or BuffID == 9465 or BuffID == 9466 then
		local nBuff_mark = target.GetBuffByOwner(9512, 1, dwSkillSrcID)
		if nBuff_mark then
			target.DelBuffByIndex(nBuff_mark.nIndex)
		end
	end

	--ɾ����dot�Ļ������buff
	if BuffID == 9361 or BuffID == 9362 or BuffID == 9363 or BuffID == 9364 then
		local nBuff_mark = target.GetBuffByOwner(9513, 1, dwSkillSrcID)
		if nBuff_mark then
			target.DelBuffByIndex(nBuff_mark.nIndex)
		end
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com