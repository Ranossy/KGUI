---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/ݶ������ɽ/skill/�ӱ�.lua
-- ����ʱ��:	03/01/11 15:38:32
-- �����û�:	yule-PC
-- �ű�˵��:	
----------------------------------------------------------------------<


-- ����Ӧ�ýű�, ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
			local tBuff = player.GetBuff(2298, 1)
			if tBuff then
				if tBuff.nStackNum >= 3 then
					player.AddBuff(0,99,2594,1)
				end				
				if tBuff.nStackNum >= 5 then
					player.Die()
				end
			end
		end
	end
end

-- ���ܷ�Ӧ�ýű�, ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com