---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/������ʱ��ӹ���.lua
-- ����ʱ��:	2013/6/18 14:04:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local a = 0
	local b = 0
	local buff1
	local buff2
	for i = 1, 10 do
		buff1 = player.GetBuff(134, i)
		if buff1 then
			a = 1
			break
		end
	end
	for i = 1, 10 do
		buff2 = player.GetBuff(6090, i)
		if buff2 then
			b = 1
			break
		end
	end
	if a == 0 and b == 0 then
		player.AddBuff(player.dwID, player.nLevel, 6088, 1, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com