---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/ϴ�辭��Ѫ��.lua
-- ����ʱ��:	2013/6/1 3:08:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5927) == 1 and player.bFightState then
		if player.nCurrentLife >= player.nMaxLife * 0.9 and (not player.GetBuff(6206, 1)) then
			player.AddBuff(dwCharacterID, player.nLevel, 6205, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 6206, 1, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com