------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-4-9
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------


--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	
	if  player.nMoveState == MOVE_STATE.ON_SWIM or player.nMoveState == MOVE_STATE.ON_FLOAT then
		if player.nCurrentLife > 4200 then
			player.nCurrentLife = player.nCurrentLife - 4200
		else
			player.Die()
		end
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com