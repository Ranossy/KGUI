---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/�˽���һ��Ѫ1.lua
-- ����ʱ��:	2013/6/5 0:28:41
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20111111
 
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

function Apply(dwCharacterID)
	--print(111111)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	--print(player.szName)
	local buff = player.GetBuff(1909, 1)
	local time = buff.nStackNum
	--print("time" .. time)
	player.AddBuff(dwCharacterID, player.nLevel, 6079, time, 1)
	for i = 1, time do
		--print(222222)
		if player.dwShapeShiftID == 0 and not player.GetBuff(7913, 1) then
			--print(333)
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.01 
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.05
		end
	end
	for m = 1, 10 do
		player.DelBuff(1909, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com