---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/������������buff.lua
-- ����ʱ��:	2013/4/23 21:48:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff1 = player.GetBuff(122, 1)
	local buff2 = player.GetBuff(122, 2)
	local buff3 = player.GetBuff(122, 3)
	local buff4 = player.GetBuff(122, 4)
	local buff5 = player.GetBuff(122, 5)
	local buff6 = player.GetBuff(122, 6)
	local buff7 = player.GetBuff(122, 7)
	if (not buff1) and (not buff2) and (not buff3) and (not buff4) and (not buff5) and (not buff6) and (not buff7) then
		player.DelBuff(5692, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com