---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/��_��ͷ_BUFF_BOT.lua
-- ����ʱ��:	2015/10/21 0:40:00
-- �����û�:	zhangyan3
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(11111)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_SWIM then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_STAND then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end

	if player.bOnHorse then
		--�˳��Ϳ�
		local buff = player.GetBuff(9891, 0)
		if buff then
			player.DelBuff(9891, buff.nLevel)
		end
		return
	end
	
	local nH,nType = player.GetAltitude()
	--print(nH .. "__" ..nType)
	--if nH < 2000 and nType == 1 then
		--player.DelBuff(9891, 1)
	--end
	--]]
	--ս���и��գ��������ۼ���ÿ��
	if player.bSprintFlag and player.bFightState then
		local nNumValue = 100 * 100
		local nNumPoint = player.nSprintPower
		if nNumPoint ~= 0 then
			if nNumPoint > nNumValue then
				if not (player.nDisableSprintPowerCost > 0) then
					player.SetSprintPower(0, nNumPoint - nNumValue)--�ۼ�����ֵ 0������,1������
				end
			else
				if not (player.nDisableSprintPowerCost > 0) then
					player.SetSprintPower(0, 0)
				end
			end
		end
	end
end


function UnApply(dwCharacterID)
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com