------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Map/ACT_��ֵ�/include/��ֵ�.lua")
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end	
	local item = player.GetEquippedHorse()
	if not item then
		return 
	end
	if item then
		if item.dwIndex == 11106 then
			player.SetDynamicSkillGroup(151)
		elseif item.dwIndex == 11105 then
			player.SetDynamicSkillGroup(141)
		else
			player.SetDynamicSkillGroup(172)
		end
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local item = player.GetEquippedHorse()
	if not item then
		return 
	end	
	player.SetDynamicSkillGroup(0)
	player.DelBuff(7698, 1)
	player.DelBuff(7819, 1)
	--player.DelBuff(7712, 1)
	if player.GetBuff(7844, 1) then
		player.DelBuff(7844, 1)
		player.SetPosition(player.nX, player.nY, player.nZ + 2560)
	end
	if item and item.dwIndex == 11106 then
		Creat5(player)
	end
	if item.dwIndex == 11649 then
		if player.nMoveState == MOVE_STATE.ON_FLY_JUMP then
			player.EndFlyJump()
		end
	end	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com