---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/ؤ�����ͨ��.lua
-- ����ʱ��:	2013/5/22 16:26:10
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5997, 1)
	if not buff then
		return
	end
	local n = buff.nStackNum
	player.nCurrentMana = player.nCurrentMana + player.nMaxMana * n * 0.01
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com