---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/�˽���һ��Ѫ2.lua
-- ����ʱ��:	2013/4/18 19:16:20
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20111111

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(1909, 2)
	local time = buff.nStackNum
	for i = 1, time do
		if player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
			--print(2222222)
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.01
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.01
	end
end
	for m = 1, 10 do
		player.DelBuff(1909, 2)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com