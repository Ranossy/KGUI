---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����ͨ��˲��.lua
-- ����ʱ��:	2013/6/13 12:23:21
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5666, 1)
	local cbuff = player.GetBuff(5667, 1)
	if player.GetSkillLevel(5838) == 1 then
		for i = 1, 8 do
			player.AddBuff(dwCharacterID, player.nLevel, 5797 + i, 1, 1)
		end
		--if buff then
		--player.DelBuff(5666, 1)
		--end
		--if not cbuff then
		--player.AddBuff(dwCharacterID, player.nLevel, 5666, 1, 1)
		--player.AddBuff(dwCharacterID, player.nLevel, 5667, 1, 1)
		--end
	end
	if player.GetSkillLevel(6481) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6099, 1, 1)
		--player.AddBuff(dwCharacterID, player.nLevel, 5666, 1, 1)
		if player.GetBuff(5666, 1) then
			player.DelBuff(5666, 1)	
		else
			player.AddBuff(dwCharacterID, player.nLevel, 5666, 1, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com