---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������ж�2.lua
-- ����ʱ��:	2013/5/28 11:05:29
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
	local buff4 = 0
	local buff5 = 0
	--�Ʋ��
	if player.GetBuff(375, 10) or player.GetBuff(375, 5) or player.GetBuff(9964, 1) then
		buff1 = 1
	end
	--������
	if player.GetBuff(376, 1) or player.GetBuff(376, 2) then
		buff2 = 1
	end
	--��̬��
	if  player.GetBuff(374, 1) then
		buff3 = 1
	end
	--������
	if  player.GetBuff(373, 1) or player.GetBuff(9957, 1) then
		buff4 = 1
	end
	--��ɽ��
	if  player.GetBuff(377, 1) then
		buff5 = 1
	end
	if buff1 + buff2 + buff3+buff4+buff5 >= 1 then
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