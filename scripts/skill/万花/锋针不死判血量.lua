---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/���벻����Ѫ��.lua
-- ����ʱ��:	2013/5/20 16:51:53
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = GetPlayer(dwSkillSrcID)
	if not target then
		player.DelBuff(5970, 1)
		return
	end

	if player.nCurrentLife <= player.nMaxLife * 0.01 then
		if player.GetScene().dwID == target.GetScene().dwID and player.GetScene().dwMapID == target.GetScene().dwMapID then
			if dwSkillSrcID == dwCharacterID or IsParty(dwCharacterID, dwSkillSrcID) then
				player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.5
				player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.5
				player.PlaySfx(505, player.nX, player.nY, player.nZ)
			end
			--[[
			--��ħ�뾭�ķ��·������Ч��
			if target.GetSkillLevel(9324) == 1 and target.GetKungfuMount() ~= nil and target.GetKungfuMount().dwSkillID == 10028 then
				player.AddBuff(player.dwID,player.nLevel,7985,1)
			end
			--]]
		end
		player.DelBuff(5970, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com