---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��˵Ļ�����.lua
-- ����ʱ��:	2015/6/5 15:11:29
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--print(1)
	local item = player.GetEquippedHorse()
	if item and item.dwIndex == 13784 then
		if player.bOnHorse then
			
			local nNumValue = 60 * 100
			local nNumPoint = player.nHorseSprintPower
			if nNumPoint > nNumValue then
				player.SetSprintPower(1, nNumPoint - nNumValue)--�ۼ�����ֵ 0������,1������
			end
			
			return
		end
	end
	
	if item and item.dwIndex == 13790 then
		if player.bOnHorse then
			--print(2)
			local nNumValue = 52 * 100
			local nNumPoint = player.nHorseSprintPower
			if nNumPoint > nNumValue then
				player.SetSprintPower(1, nNumPoint - nNumValue)--�ۼ�����ֵ 0������,1������
			end
			
			return
		end
	end
	
	if player.nMoveState == MOVE_STATE.ON_FLY_JUMP then
	--	print(3)
		player.EndFlyJump()
		player.SetTurnRange(128, 128, 64, -64)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com