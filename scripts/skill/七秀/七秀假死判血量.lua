---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���������Ѫ��.lua
-- ����ʱ��:	2013/8/1 14:02:04
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.GetBuff(6183, 1) then
		if player.nCurrentLife <= player.nMaxLife * 0.01 then
			player.CastSkill(14708,1)									--���
			player.AddBuff(dwCharacterID, player.nLevel, 6182, 1, 1)	--��������
			player.AddBuff(dwCharacterID, player.nLevel, 6183, 1, 1)	--����CD
		end
		--player.AddBuff(dwCharacterID, player.nLevel, 6183, 1, 1)
	end
	if player.nCurrentLife <= player.nMaxLife * 0.01 then
		player.AddBuff(dwCharacterID, player.nLevel, 6473, 1, 1)	--�ӳ�ɾ��6179
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com