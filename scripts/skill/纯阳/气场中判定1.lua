---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������ж�1.lua
-- ����ʱ��:	2013/5/27 20:14:22
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff1 = 0
	local buff2 = 0
	local buff3 = 0
	--���ǳ�
	if player.GetBuff(2930, 7) or player.GetBuff(378, 7) or player.GetBuff(9951, 1) then
		buff1 = 1
	end
	--��̫��
	if player.GetBuff(2928, 5) or player.GetBuff(561, 5) then
		buff2 = 1
	end
	--��̫��
	if  player.GetBuff(374, 1) then
		buff3 = 1
	end
	if buff1 + buff2+buff3 >= 1 then
		if player.GetSkillLevel(6471) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6092, 1, 1)
		end
		if player.GetSkillLevel(6472) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6093, 1, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com