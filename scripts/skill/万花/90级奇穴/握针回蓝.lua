---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/�������.lua
-- ����ʱ��:	2013/4/23 14:30:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwSrcID)
	if not player then 
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		return
	end
	if not target then
		return
	end

	--��Ŀ����Լ�����
	if player.GetSkillLevel(5794) == 1 then
		target.nCurrentMana = target.nMaxMana * 0.01 + target.nCurrentMana
		--target.nCurrentMana = target.nMaxMana * 0.01 + target.nCurrentMana
	end

	--[[
	if player.GetSkillLevel(5783) == 1 and not target.GetBuff(7668, 1) and target.nCurrentLife <= target.nMaxLife * 0.3 then
		--print("11111111")
		target.AddBuff(player.dwID, player.nLevel, 7689, 1)
		if target.GetBuff(7689, 1) then
			local buff = target.GetBuff(7689, 1)
			buff.nCustomValue = player.dwID
			--print("buff.nCustomValue")
		end
		--player.CastSkill(9015, 1, TARGET.PLAYER, target.dwID)
		target.AddBuff(0,99,7668,1)
   	end
	--]]
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com